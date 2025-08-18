{ pkgs }:

let
  categories = import ./categories.nix { inherit pkgs; };
in
{
  systemPackages = with categories; 
    cli ++ development ++ desktop ++ productivity ++ system;
}