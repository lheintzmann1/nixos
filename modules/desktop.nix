{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.excludePackages = with  pkgs; [

  ];

  environment.gnome.excludePackages = with pkgs; [
    yelp # Help
    epiphany # Web browser
    seahorse # Password manager
    geary # Email client
    gnome-tour
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-weather
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
