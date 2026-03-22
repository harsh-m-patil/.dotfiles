{ config, pkgs, ...}:

{
  home.username = "harshmpatil";
  home.homeDirectory = "/home/harshmpatil";
  home.stateVersion = "25.11";
  services.hyprpaper.enable = true;
  programs.zsh.enable = true;
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".zshrc".source = ../.zshrc;
}
