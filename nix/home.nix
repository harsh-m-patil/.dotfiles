{ config, pkgs, ...}:

{
  home.username = "harshmpatil";
  home.homeDirectory = "/home/harshmpatil";
  home.stateVersion = "25.11";
  services.hyprpaper.enable = true;
  home.file.".config/hypr".source = ./config/hypr;
}
