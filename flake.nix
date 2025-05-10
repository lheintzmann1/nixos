{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
  let
    inherit (self) outputs;
    system = "x86_64-linux";
    username = "lucas";
    hostname = "nixos";

    lib = nixpkgs.lib;

    overlays = [
      (import ./overlays inputs)
    ];

    nixpkgsConfig = {
      config = {
        allowUnfree = true;
      };
      inherit overlays;
    };
  in
  {
    nixosConfigurations.${hostname} = lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
      };
      modules = [
        { nixpkgs = nixpkgsConfig; }
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = import ./home-manager/home.nix;
          };
        }
      ];
    };
  };
}
