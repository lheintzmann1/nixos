{ config, pkgs, ... }:

let
  myPackages = import ../pkgs { inherit pkgs; };
in
{
  environment.systemPackages = myPackages.systemPackages;
}
