{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar.enable = true;
	programs.zsh.enable = true;
	programs.nix-ld.enable = true;

  services.xserver.xkb.layout = "us";

  services.printing.enable = true;

  virtualisation.docker.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

  users.users.harshmpatil = {
    isNormalUser = true;
    description = "harshmpatil";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    jq
    wget
    git
    ghostty
    stow
    fzf
    fd
    ripgrep
    fastfetch
    gnumake
    cmake
    starship
		gcc
		tree-sitter
    zoxide
    brightnessctl
    tmux
		pnpm
    nodejs
		pulseaudio
    go
    hyprpaper
    hyprpicker
    unzip
    tree
    eza
    gitleaks
    uv
    yt-dlp
    opencode
    typst
		hyprshot
		telegram-desktop
		mpv

    unstable.neovim
    quickshell
		bun

		# lsp servers
		lua-language-server
		gopls
		inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    typescript-language-server
		tinymist
  ];

  fonts.packages = with pkgs; [
    lilex
		geist-font
    nerd-fonts.jetbrains-mono
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [ "https://vicinae.cachix.org" ];
    extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
  };

  system.stateVersion = "25.11";
}
