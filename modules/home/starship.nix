{ config, pkgs, inputs, ... }:

{
  programs.starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ../../dotfiles/starship/starship.toml);
  };
}