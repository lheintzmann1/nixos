{ pkgs }:

rec {
  # CLI Tools
  cli = with pkgs; [
    # Version control
    gh git git-lfs
    
    # System tools
    tree fastfetch htop btop
    fd ripgrep bat eza
    unzip p7zip
    
    # Network tools
    wget curl
    nmap
  ];

  # Development
  development = with pkgs; [
    vscode    
    
    # Git tools
    gitui
    lazygit
  ];

  # Desktop Environment
  desktop = with pkgs; [
    # Whitesur GTK theme
    (whitesur-gtk-theme.override {
      altVariants = [ "normal" ];
      colorVariants = [ "dark" ];
      opacityVariants = [ "normal" ];
      themeVariants = [ "blue" ];
    })
    whitesur-icon-theme
    whitesur-cursors
    
    # GNOME
    gnome-extension-manager
    gnome-tweaks
    
    # GNOME Extensions
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes
  ];

  # Productivity (& Media)
  productivity = with pkgs; [
    firefox
    alacritty
    
    vlc
    onlyoffice-desktopeditors
  ];

  # System
  system = with pkgs; [
    ntfs3g
    os-prober
  ];
}