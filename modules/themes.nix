{ config, pkgs, ... }:

{
  # Set default theme preferences for GNOME to use Adwaita
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    gtk-theme='Adwaita-dark'
    icon-theme='Adwaita'
    cursor-theme='Adwaita'
    cursor-size=24
    
    [org.gnome.desktop.wm.preferences]
    theme='Adwaita'
    button-layout=':minimize,maximize,close'
    
    [org.gnome.desktop.background]
    picture-options='zoom'
    
    [org.gnome.desktop.screensaver]
    picture-options='zoom'
    
    [org.gnome.mutter]
    center-new-windows=true
  '';
}