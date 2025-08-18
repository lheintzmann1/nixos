{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/bootloader.nix
    ./modules/desktop.nix
    ./modules/hardware.nix
    ./modules/localization.nix
    ./modules/network.nix
    ./modules/nix-settings.nix
    ./modules/packages.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/themes.nix
    ./modules/security.nix
  ];

  system.stateVersion = "24.11";
}