{ config, pkgs, ... }:

{
  # Set default theme preferences for GNOME
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    gtk-theme='WhiteSur-Dark'
    icon-theme='WhiteSur-dark'
    cursor-theme='WhiteSur-cursors'
    cursor-size=24
    
    [org.gnome.desktop.wm.preferences]
    theme='WhiteSur-Dark'
    button-layout=':minimize,maximize,close'
    
    [org.gnome.desktop.background]
    picture-options='zoom'
    
    [org.gnome.desktop.screensaver]
    picture-options='zoom'
    
    [org.gnome.mutter]
    center-new-windows=true
  '';
}