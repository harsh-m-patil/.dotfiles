{
  inputs,
  pkgs,
  system,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    vim
    neovim
    zed-editor
    sesh
    nixfmt
    git
    tmux
    zoxide
    fzf
    fd
    ripgrep
    lazygit
    tree
    eza
    wget
    unzip
    fastfetch
    stow

    gcc
    gnumake
    cmake
    tree-sitter

    gh
    jq
    yq
    gitleaks
    databricks-cli
    yt-dlp
    typst
    opencode
    inputs.herdr.packages.${system}.default

    nodejs_22
    pnpm
    yarn
    bun
    go
    uv
    scala
    sbt

    lua-language-server
    gopls
    vtsls
    nil
    metals
  ];

  fonts.packages = with pkgs; [
    lilex
    geist-font
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
  ];

  programs.zsh.enable = true;
}
