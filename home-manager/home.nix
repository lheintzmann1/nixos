{ config, pkgs, inputs, ... }:

{
  imports = [
    ./configs/alacritty.nix
    ./configs/vscode.nix
];

home = {
    username = "lucas";
    homeDirectory = "/home/lucas";
    stateVersion = "24.11";

  sessionVariables = {
    # EDITOR = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  packages = with pkgs; [

  ];
};

programs = {
  home-manager.enable = true;
  bash.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme.override {
        altVariants = [ "normal" ];
        colorVariants = [ "dark" ];
        opacityVariants = [ "normal" ];
        themeVariants = [ "blue" ];
      };
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
    cursorTheme = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
      size = 24;
    };
  };

  # Additional dconf settings for WhiteSur theme
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "WhiteSur-dark";
      cursor-theme = "WhiteSur-cursors";
      cursor-size = 24;
      font-name = "Inter 11";
      document-font-name = "Inter 11";
      monospace-font-name = "FiraCode Nerd Font 10";
    };
    
    "org/gnome/desktop/wm/preferences" = {
      theme = "WhiteSur-Dark";
      button-layout = ":minimize,maximize,close";
      titlebar-font = "Inter Bold 11";
    };
    
    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = true;
    };
  };

}
