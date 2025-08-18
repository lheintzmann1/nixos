{ config, pkgs, ... }:

{
  # Set default theme preferences for GNOME
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    gtk-theme='WhiteSur-Dark'
    icon-theme='WhiteSur-dark'
    cursor-theme='WhiteSur-cursors'
    
    [org.gnome.desktop.wm.preferences]
    theme='WhiteSur-Dark'
  '';
}