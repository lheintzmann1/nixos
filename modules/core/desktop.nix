{ pkgs, ... }: {
  services = {
    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
  
  # Remove unwanted GNOME packages
  environment.gnome.excludePackages = with pkgs; [
    epiphany geary gnome-tour gnome-contacts
    gnome-maps gnome-music gnome-weather yelp
  ];
  
  # GNOME extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes
  ];
}