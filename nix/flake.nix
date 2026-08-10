{
  description = "Harsh's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager/master";
    herdr.url = "github:ogulcancelik/herdr";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
      herdr,
    }:
    let
      configuration = { pkgs, config, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget

        nixpkgs.config.allowUnfree = true;

        # Required by nix-darwin for user-scoped options like homebrew.*.
        system.primaryUser = "harshwardhan.p";
        users.users."harshwardhan.p".home = "/Users/harshwardhan.p";

        environment.systemPackages = [
          pkgs.vim
          pkgs.neovim
          pkgs.zed-editor

          pkgs.git
          pkgs.tmux
          pkgs.zoxide
          pkgs.fzf
          pkgs.mkalias
          pkgs.nixfmt
          pkgs.ghostty-bin
          pkgs.starship
          pkgs.fd
          pkgs.ripgrep
          pkgs.lazygit
          pkgs.tree
          pkgs.gcc
          pkgs.cmake
          pkgs.tree-sitter
          pkgs.gh
          pkgs.jq
          pkgs.yq
          pkgs.sesh
          pkgs.stow
          herdr.packages.${pkgs.system}.default

          pkgs.databricks-cli
          pkgs.gitleaks

          # language runtimes, package managers and more
          pkgs.nodejs_22
          pkgs.pnpm
          pkgs.yarn
          pkgs.go
          pkgs.uv
          pkgs.scala
          pkgs.sbt
          pkgs.mysql84

          # languages servers
          pkgs.gopls
          pkgs.lua-language-server
          pkgs.vtsls
          pkgs.nil # nix-lsp
          pkgs.metals
        ];

        fonts.packages = [
          pkgs.lilex
          pkgs.nerd-fonts.jetbrains-mono
          pkgs.nerd-fonts.geist-mono
        ];

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";
        programs.zsh.enable = true;

        homebrew = {
          enable = true;
          casks = [
            "aerospace"
            "claude-code"
            "postman"
            "raycast"
            "codex"
            "t3-code"
          ];
          onActivation.cleanup = "zap";
        };

        home-manager = {
          backupFileExtension = "backup";
          users."harshwardhan.p" = import ./home.nix;
        };

        system.activationScripts.applications.text =
          let
            env = pkgs.buildEnv {
              name = "system-applications";
              paths = config.environment.systemPackages;
              pathsToLink = [ "/Applications" ];
            };
          in
          pkgs.lib.mkForce ''
            # Set up applications.
            echo "setting up /Applications..." >&2
            rm -rf /Applications/Nix\ Apps
            mkdir -p /Applications/Nix\ Apps
            find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
            while read -r src; do
              app_name=$(basename "$src")
              echo "copying $src" >&2
              ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            done
          '';

        # Enable alternative shell support in nix-darwin.
        # programs.fish.enable = true;

        security.pam.services.sudo_local.touchIdAuth = true;

        system.defaults = {
          dock.autohide = true;
          dock.persistent-apps = [
            "${pkgs.ghostty-bin}/Applications/Ghostty.app"
            "/Applications/Google Chrome.app/"
            "/Applications/Slack.app/"
          ];
          finder.FXPreferredViewStyle = "clmv";
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain.KeyRepeat = 2;
        };

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 6;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "harshwardhan.p";
              trust = {
                formulae = [ ];
                casks = [ "nikitabobko/tap/aerospace" ];
                taps = [ ];
              };
              autoMigrate = true;
            };
          }
        ];
      };
    };
}
