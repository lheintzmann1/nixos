{ pkgs, user, ... }: {
  imports = [
    ./audio.nix
    ./boot.nix
    ./desktop.nix
    ./fonts.nix
    ./locale.nix
    ./network.nix
    ./security.nix
  ];
  
  # User configuration
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };
  
  # Essential packages
  environment.systemPackages = with pkgs; [
    # Version control
    gh git git-lfs
    
    # System tools
    tree fastfetch htop btop
    fd ripgrep bat eza
    unzip p7zip
    
    # Network tools
    wget curl

    # Development
    vscode    

    # Languages tools
    rustup
    gcc
    nodejs
    perl
    
    # Git tools
    gitui
    lazygit

    # GNOME utilities
    gnome-extension-manager
    gnome-tweaks
    
    # GNOME Extensions
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes

    # WhiteSur theme components
    whitesur-icon-theme
    whitesur-cursors

    # Productivity
    firefox
    alacritty
    onlyoffice-desktopeditors
    
    # Media
    vlc

    # System
    ntfs3g
    os-prober
  ];

  # Allow Zsh as a login shell
  environment.shells = [ pkgs.zsh ];
}