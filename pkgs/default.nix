{ pkgs }:

# WhiteSur Theme Configuration Options:
# 
# altVariants: [ "normal" "alt" "all" ] - Controls window decorations style
# colorVariants: [ "light" "dark" ] - Light or dark theme variants  
# opacityVariants: [ "normal" "solid" ] - Controls transparency levels
# themeVariants: [ "default" "blue" "purple" "pink" "red" "orange" "yellow" "green" "grey" "all" ] - Color accent variants
# nautilusSize: [ "default" "180" "220" "240" "260" "280" ] - Nautilus sidebar width in pixels  
# panelOpacity: [ "default" "30" "45" "60" "75" ] - Panel transparency percentage
# panelSize: [ "default" "smaller" "bigger" ] - Panel height (32px default, smaller=28px, bigger=40px)

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

    ## Whitesur GTK theme (customized)
    (whitesur-gtk-theme.override {
      altVariants = [ "normal" ];
      colorVariants = [ "dark" ];
      opacityVariants = [ "normal" ];
      themeVariants = [ "blue" ];
    })
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
