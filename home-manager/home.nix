{ config, pkgs, ... }:

{
  imports = [
    ./configs/alacritty.nix
  ];

  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  home.stateVersion = "24.11";
}
