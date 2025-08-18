{ pkgs }:

{
  systemPackages = with pkgs; [
    # CLI Tools
    gh
    git
    git-lfs
    tree

    # Desktop Environment
    ## Gnome
    gnome-extension-manager
    gnome-tweaks
    gnomeExtensions.gtk4-desktop-icons-ng-ding

    ## Whitesur GTK theme
    whitesur-gtk-theme
    whitesur-icon-theme
    whitesur-cursors
    
    ## Additional theming tools
    gnome-themes-extra
    gtk-engine-murrine

    # Development
    vscode


    # Media
    # (empty for future packages)

    # Networking
    # (empty for future packages)

    # Productivity
    obsidian

    # Security
    # (empty for future packages)

    # System Tools
    fastfetch
    ntfs3g
    os-prober

    # Terminals
    alacritty

    # Utilities
    # (empty for future packages)

    # Virtualization
    # (empty for future packages)
  ];
}
