{
  description = "Multi-host NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: let
    lib = nixpkgs.lib;
    
    # Supported systems
    systems = [ "x86_64-linux" "aarch64-linux" ];
    
    # Common configuration
    commonModules = [
      ./modules/common.nix
      home-manager.nixosModules.home-manager
    ];
    
    # Host-specific configurations
    hosts = {
      nixos = {
        system = "x86_64-linux";
        user = "lucas";
        modules = [ ./hosts/nixos ];
      };
      # Add more hosts here as needed
      # laptop = {
      #   system = "x86_64-linux";
      #   user = "lucas";
      #   modules = [ ./hosts/laptop ];
      # };
    };
    
    # Generate nixosConfigurations for each host
    mkHost = hostname: { system, user, modules }: lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs hostname user; };
      modules = commonModules ++ modules;
    };
  in {
    nixosConfigurations = lib.mapAttrs mkHost hosts;
  };
}