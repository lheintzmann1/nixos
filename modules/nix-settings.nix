{ config, pkgs, ... }:

{
  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 2d";
  };
  nix.settings.auto-optimise-store = true;

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
