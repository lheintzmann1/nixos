{ inputs, pkgs, ... }:

{
  programs.alacritty.enable = true;

  # Source Alacritty config from dotfiles
  xdg.configFile."alacritty".source = ../../dotfiles/alacritty;

  # Provide theme file via flake input so it can be imported from the TOML
  xdg.configFile."alacritty/theme.toml".source = ../../dotfiles/alacritty/theme.toml;
}