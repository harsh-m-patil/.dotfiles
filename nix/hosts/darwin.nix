{
  config,
  inputs,
  lib,
  pkgs,
  username,
  ...
}:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    primaryUser = username;
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    stateVersion = 6;

    defaults = {
      dock = {
        autohide = true;
        persistent-apps = [
          "${pkgs.ghostty-bin}/Applications/Ghostty.app"
          "/Applications/Google Chrome.app/"
          "/Applications/Slack.app/"
        ];
      };

      finder.FXPreferredViewStyle = "clmv";

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
      };
    };

    activationScripts.applications.text =
      let
        applications = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = [ "/Applications" ];
        };
      in
      lib.mkForce ''
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${applications}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${lib.getExe pkgs.mkalias} "$src" "/Applications/Nix Apps/$app_name"
        done
      '';
  };

  users.users.${username}.home = "/Users/${username}";

  environment.systemPackages = with pkgs; [
    mkalias
    ghostty-bin
    mysql84
    metals
    databricks-cli
    scala
    sbt
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = [
      {
        name = "swigy/brew";
        clone_target = "https://github.com/swiggy-private/homebrew-brew.git";
      }
      "nikitabobko/tap"
    ];

    brews = [ "coast" ];

    casks = [
      "aerospace"
      "claude-code"
      "postman"
      "raycast"
      "codex"
      "t3-code"
    ];
  };
}
