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
    enabled-extensions=['dash-to-dock@micxgx.gmail.com', 'blur-my-shell@aunetx', 'gtk4-ding@smedius.gitlab.com','user-theme@gnome-shell-extensions.gcampax.github.com']

    [org.gnome.shell.extensions.blur-my-shell]
    settings-version=2

    [appfolder]
    brightness=0.59999999999999998
    sigma=30

    [applications]
    blur=false

    [coverflow-alt-tab]
    pipeline='pipeline_default'

    [dash-to-dock]
    blur=false
    brightness=0.78000000000000003
    override-background=false
    pipeline='pipeline_default_rounded'
    sigma=32
    static-blur=true
    style-dash-to-dock=0

    [lockscreen]
    pipeline='pipeline_default'

    [overview]
    pipeline='pipeline_default'

    [panel]
    brightness=0.59999999999999998
    pipeline='pipeline_default'
    sigma=30

    [screenshot]
    pipeline='pipeline_default'

    [window-list]
    brightness=0.59999999999999998
    sigma=30

    [org.gnome.shell.extensions.dash-to-dock]
    always-center-icons=false
    apply-custom-theme=false
    background-opacity=0.75
    click-action='cycle-windows'
    custom-background-color=false
    custom-theme-customize-running-dots=false
    custom-theme-running-dots-border-width=0
    custom-theme-shrink=true
    dash-max-icon-size=41
    disable-overview-on-startup=true
    dock-fixed=true
    dock-position='BOTTOM'
    extend-height=false
    height-fraction=0.90000000000000002
    hide-tooltip=false
    hot-keys=false
    middle-click-action='launch'
    multi-monitor=false
    preferred-monitor=-2
    preferred-monitor-by-connector='HDMI-5'
    running-indicator-dominant-color=false
    running-indicator-style='DOTS'
    shift-click-action='minimize'
    shift-middle-click-action='launch'
    show-icons-emblems=true
    transparency-mode='FIXED'
    unity-backlit-items=false

    [org.gnome.shell.extensions.gtk4-ding]
    dark-text-in-labels=false
    icon-size='standard'
    show-trash=false
  '';
}
