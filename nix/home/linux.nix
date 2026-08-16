{
  inputs,
  pkgs,
  ...
}:

{
  imports = [ ../home.nix ];

  home.stateVersion = "25.11";

  services.hyprpaper.enable = true;

  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment.USE_LAYER_SHELL = 1;
    };

    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      bluetooth
      nix
      power-profile
    ];
  };

  xdg.configFile = {
    hypr.source = ../config/hypr;
    quickshell.source = ../config/quickshell;
    "dunst/dunstrc".source = ../config/dunst/dunstrc;
  };
}
