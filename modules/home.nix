{ inputs, user, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${user} = import ./home;
    extraSpecialArgs = { inherit inputs; };
  };
}