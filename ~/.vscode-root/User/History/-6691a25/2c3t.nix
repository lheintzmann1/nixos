{ config, pkgs, inputs, ... }:

{
  imports = [
    ./configs/alacritty.nix
    ./configs/vscode.nix
    ./configs/git.nix
    ./configs/bash.nix
  ];

  home = {
    username = "lucas";
    homeDirectory = "/home/lucas";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "code";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
    };
  };

  programs = {
    home-manager.enable = true;
    
    # Moderns CLI tools
    eza.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    
    # Prompt
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        format = "$all$character";
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };

  # GTK
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

  # dconf
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "WhiteSur-dark";
      cursor-theme = "WhiteSur-cursors";
      cursor-size = 24;
      font-name = "Inter 11";
      document-font-name = "Inter 11";
      monospace-font-name = "JetBrainsMono Nerd Font 10";
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