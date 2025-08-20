{ inputs, user, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = import ./home;
    extraSpecialArgs = { inherit inputs; };
  };
}