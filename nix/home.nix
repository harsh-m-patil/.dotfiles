{ ... }:

{
  home.stateVersion = "25.05";

  home.file.".zshrc".source = ./config/.zshrc;
  home.file.".tmux.conf".source = ./config/.tmux.conf;
  home.file.".vimrc".source = ./config/.vimrc;
  home.file.".zsh_aliases".source = ./config/.zsh_aliases;

  xdg.configFile."starship.toml".source = ./config/starship.toml;
  xdg.configFile."ghostty".source = ./config/ghostty;
}
