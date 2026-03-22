{ config, pkgs, ...}:

{
  home.username = "harshmpatil";
  home.homeDirectory = "/home/harshmpatil";
  home.stateVersion = "25.11";
  services.hyprpaper.enable = true;
  programs.zsh = {
    enable = true;
    initContent = builtins.readFile ../.zshrc;
  };
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/ghostty".source = ./config/ghostty;
}
