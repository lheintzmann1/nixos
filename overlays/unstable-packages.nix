inputs:
final: prev: {
  unstable = import inputs.nixpkgs-unstable {
    inherit (prev.stdenv) system;
    config.allowUnfree = true;
  };
}
