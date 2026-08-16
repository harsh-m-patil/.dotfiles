# My Dotfiles

Cross-platform dotfiles managed with Nix, nix-darwin, NixOS, and Home Manager.

The same packages and user configuration are shared between macOS and Linux.
Platform-specific settings live in separate host modules.

## Repository structure

```text
.
├── .config/nvim/                  # Neovim configuration
├── nix/
│   ├── flake.nix                  # macOS and NixOS flake outputs
│   ├── configuration.nix          # shared system packages and settings
│   ├── home.nix                   # shared Home Manager configuration
│   ├── home/
│   │   ├── darwin.nix             # macOS Home Manager settings
│   │   └── linux.nix              # Linux Home Manager settings
│   ├── hosts/
│   │   ├── darwin.nix             # macOS, Homebrew, and Aerospace settings
│   │   └── nixos/
│   │       ├── configuration.nix  # NixOS, Hyprland, and Linux services
│   │       └── hardware-configuration.nix
│   └── config/                    # configuration files linked by Home Manager
├── scripts/
└── README.md
```

## Clone the repository

```bash
git clone https://github.com/harsh-m-patil/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/nix
```

## macOS

The macOS configuration targets Apple Silicon (`aarch64-darwin`) and is exposed
as `darwinConfigurations.mac`.

### First installation

Install Nix, then bootstrap nix-darwin from the flake:

```bash
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#mac
```

The configuration installs shared command-line tools and macOS-specific
applications. Homebrew formulae, casks, taps, Aerospace, system defaults, and
Touch ID for `sudo` are managed declaratively.

The private `swigy/brew` tap requires access to its GitHub repository.

### Apply later changes

```bash
cd ~/.dotfiles/nix
sudo darwin-rebuild switch --flake .#mac
```

## NixOS

The Linux configuration targets `x86_64-linux` and is exposed as
`nixosConfigurations.nixos`.

It includes the shared packages and dotfiles together with NixOS-specific
configuration for Hyprland, GNOME, Docker, PipeWire, Bluetooth, Vicinae, and
Quickshell.

### Hardware configuration

`nix/hosts/nixos/hardware-configuration.nix` describes the existing Linux
machine. Before installing on different hardware, replace it with the generated
configuration for that machine:

```bash
sudo nixos-generate-config --show-hardware-config \
  > ~/.dotfiles/nix/hosts/nixos/hardware-configuration.nix
```

Review the generated filesystem and boot settings before activating it.

### Apply the configuration

From an existing NixOS installation:

```bash
cd ~/.dotfiles/nix
sudo nixos-rebuild switch --flake .#nixos
```

## Validate and format

Run the formatter from the `nix` directory:

```bash
nix fmt
```

Evaluate both platform configurations without activating either system:

```bash
nix flake check --all-systems
nix eval --raw .#darwinConfigurations.mac.system.drvPath
nix eval --raw .#nixosConfigurations.nixos.config.system.build.toplevel.drvPath
```

## Update dependencies

Update the locked flake inputs and then rebuild the current platform:

```bash
cd ~/.dotfiles/nix
nix flake update
```

Review `flake.lock` and run the validation commands before switching the system.

## State versions

The NixOS, nix-darwin, and Home Manager state versions intentionally remain at
the versions used when each machine was first configured. Do not change them as
part of a routine dependency update.
