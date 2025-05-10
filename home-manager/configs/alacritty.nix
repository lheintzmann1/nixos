{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        startup_mode = "Maximized";
      };
      font = {
        normal = { family = "JetBrainsMono Nerd Font Mono"; };
        bold = { family = "JetBrainsMono Nerd Font Mono"; };
        italic = { family = "JetBrainsMono Nerd Font Mono"; };
        bold_italic = { family = "JetBrainsMono Nerd Font Mono"; };
        size = 10;
      };
    };
  };
}
