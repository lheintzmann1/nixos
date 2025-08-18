{ config, pkgs, inputs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [
          inputs.alacritty-theme.ayu_dark
        ];
      };
      window = {
        startup_mode = "Maximized";
      };
      font = {
        normal = { family = "JetBrainsMono Nerd Font Mono"; };
        bold = { family = "JetBrainsMono Nerd Font Mono"; };
        italic = { family = "JetBrainsMono Nerd Font Mono"; };
        bold_italic = { family = "JetBrainsMono Nerd Font Mono"; };
        size = 11;
      };
    };
  };
}
