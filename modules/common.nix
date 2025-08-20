{ inputs, hostname, user, pkgs, ... }: {
  imports = [
    ./core
    ./home.nix
  ];

  # System basics
  system.stateVersion = "24.11";
  networking.hostName = hostname;
  
  # Nix configuration
  nix = {
    settings = {
      # Enable flakes and experimental features
      experimental-features = [ "nix-command" "flakes" ];
      
      # Optimizations
      auto-optimise-store = true;
      max-jobs = "auto";
      cores = 0;

      # Cache settings
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
  
  # Overlay for unstable packages
  nixpkgs = {
    overlays = [ (final: prev: { unstable = import inputs.nixpkgs-unstable { inherit (prev.stdenv) system; config.allowUnfree = true; }; }) ];
    # Allow unfree packages
    config.allowUnfree = true;
  };
}