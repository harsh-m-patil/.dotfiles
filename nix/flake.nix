{
  description = "Harsh's NixOS and nix-darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    herdr.url = "github:ogulcancelik/herdr";

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae.url = "github:vicinaehq/vicinae";

    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      home-manager,
      nix-darwin,
      nix-homebrew,
      nixpkgs,
      vicinae,
      ...
    }:
    let
      darwinSystem = "aarch64-darwin";
      darwinUsername = "harshwardhan.p";
      linuxSystem = "x86_64-linux";
      linuxUsername = "harshmpatil";
    in
    {
      darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs;
          system = darwinSystem;
          username = darwinUsername;
        };

        modules = [
          ./configuration.nix
          ./hosts/darwin.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew

          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${darwinUsername} = import ./home/darwin.nix;
            };

            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = darwinUsername;
              autoMigrate = true;

              trust = {
                formulae = [ "swigy/brew/coast" ];
                casks = [ "nikitabobko/tap/aerospace" ];
                taps = [ "nikitabobko/tap" ];
              };
            };
          }
        ];
      };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = linuxSystem;

        specialArgs = {
          inherit inputs;
          system = linuxSystem;
          username = linuxUsername;
        };

        modules = [
          ./configuration.nix
          ./hosts/nixos/configuration.nix
          ./hosts/nixos/hardware-configuration.nix
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ vicinae.homeManagerModules.default ];
              extraSpecialArgs = { inherit inputs; };
              users.${linuxUsername} = import ./home/linux.nix;
            };
          }
        ];
      };

      formatter = nixpkgs.lib.genAttrs [
        darwinSystem
        linuxSystem
      ] (system: nixpkgs.legacyPackages.${system}.nixfmt);
    };
}
