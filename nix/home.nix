{
  home.file = {
    ".zshrc".source = ./config/.zshrc;
    ".tmux.conf".source = ./config/.tmux.conf;
    ".vimrc".source = ./config/.vimrc;
    ".zsh_aliases".source = ./config/.zsh_aliases;
  };

  xdg.configFile = {
    "starship.toml".source = ./config/starship.toml;
    ghostty.source = ./config/ghostty;
  };
}
