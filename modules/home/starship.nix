{ config, pkgs, inputs, ... }:

{
  programs.starship.enable = true;

  # Source starship configuration from dotfiles
  xdg.configFile."starship".source = config.lib.file.mkOutOfStoreSymlink ../../dotfiles/starship;
}