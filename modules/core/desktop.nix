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

  # GNOME settings
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.wm.preferences]
    button-layout=':minimize,maximize,close'

    [org.gnome.shell]
    enabled-extensions=['dash-to-dock@micxgx.gmail.com', 'blur-my-shell@aunetx', 'user-theme@gnome-shell-extensions.gcampax.github.com']

    [org.gnome.shell.extensions.dash-to-dock]
    dock-position='BOTTOM'
    dash-max-icon-size=36
    click-action='minimize-or-previews'
    show-trash=true
    show-mounts=false

    [org.gnome.shell.extensions.blur-my-shell]
    sigma=30
    brightness=0.8
    style-components=['panel', 'dash', 'overview', 'applications']
    hacks-level=2
  '';
}