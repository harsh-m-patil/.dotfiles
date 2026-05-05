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
  programs.gh.enable = true;
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/ghostty".source = ./config/ghostty;
  home.file.".config/quickshell".source = ./config/quickshell;
  home.file.".config/starship.toml".source = ./config/starship.toml;
}
