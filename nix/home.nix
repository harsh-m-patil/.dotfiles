{ config, pkgs, ...}:

{
  home.username = "harshmpatil";
  home.homeDirectory = "/home/harshmpatil";
  home.stateVersion = "25.11";
  home.file.".zshrc".source = ../.zshrc;
}
