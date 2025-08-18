{ config, pkgs, inputs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [
          inputs.alacritty-theme.packages.${pkgs.system}.ayu_dark
        ];
      };
      
      window = {
        startup_mode = "Maximized";
        opacity = 0.95;  # Légère transparence
        blur = true;
        decorations = "full";
        padding = {
          x = 8;
          y = 8;
        };
      };
      
      font = {
        normal = { family = "JetBrainsMono Nerd Font Mono"; };
        bold = { family = "JetBrainsMono Nerd Font Mono"; };
        italic = { family = "JetBrainsMono Nerd Font Mono"; };
        bold_italic = { family = "JetBrainsMono Nerd Font Mono"; };
        size = 11;
      };
      
      # Amélioration des performances
      env = {
        TERM = "alacritty";
      };
      
      cursor = {
        style = {
          shape = "Block";
          blinking = "Off";
        };
        vi_mode_style = "Underline";
      };
      
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
    };
  };
}