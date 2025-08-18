{ config, pkgs, ... }:

{
  nix = {
    settings = {
      # Experimental features
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      
      # Optimizations
      auto-optimise-store = true;
      max-jobs = "auto";
      cores = 0;  # Utilise tous les cœurs
      
      # Cache
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      
      # Automatic garbage collection
      keep-outputs = true;
      keep-derivations = true;
    };
    
    # Optimized garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
    
    # Automatic optimizations
    optimise = {
      automatic = true;
      dates = [ "03:45" ];
    };
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };
}