{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 10; y = 10; };
        opacity = 0.9;
      };
      font = {
        normal = { family = "FiraCode"; style = "Regular"; };
        size = 12;
      };
    };
  };
}
