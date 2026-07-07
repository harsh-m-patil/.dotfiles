# My Dotfiles

Minimal macOS dotfiles managed with Nix.

## What this branch contains

This branch is focused on macOS with:
- `nix-darwin`
- Home Manager
- Neovim
- Zsh
- Tmux
- Ghostty

## Structure

```text
.
├── .config/nvim/   # Neovim config
├── nix/
│   ├── flake.nix   # nix-darwin config
│   ├── home.nix    # Home Manager config
│   └── config/     # linked shell/editor config files
├── scripts/        # helper scripts
└── README.md
```

## Apply config

1. Clone the repo

```bash
git clone https://github.com/harsh-m-patil/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/nix
```

2. Apply the macOS config

```bash
darwin-rebuild switch --flake .#mac
```

## Notes

- Homebrew is managed through Nix.
- Git hooks path is set in `.gitconfig`.
- Neovim config lives in `.config/nvim`.
- Shell config files are in `nix/config/`.
