inputs:
final: prev:
let
  unstable = import ./unstable-packages.nix inputs final prev;
in
unstable
