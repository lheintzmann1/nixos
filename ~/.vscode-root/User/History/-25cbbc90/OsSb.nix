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
    # Extensions
    
    
    # Git tools
    gitui
    lazygit
  ];

  # Desktop Environment
  desktop = with pkgs; [
    # Votre config WhiteSur existante
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
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    
    # Extensions GNOME utiles
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
    gnomeExtensions.clipboard-indicator
  ];

  # Media et productivité
  productivity = with pkgs; [
    firefox
    alacritty
    
    vlc
    onlyoffice-desktopeditors
  ];

  # Outils système
  system = with pkgs; [
    ntfs3g
    os-prober
  ];
}