{ ... }:

{
  imports = [ ../home.nix ];

  home.stateVersion = "25.05";

  xdg.configFile = {
    "zed/settings.json".source = ../config/zed/settings.json;
    "zed/keymap.json".source = ../config/zed/keymap.json;
  };
}
