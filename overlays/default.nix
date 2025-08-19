final: prev:
  (import ./unstable-packages.nix final prev) //
  (import ./whitesur-override.nix inputs final prev)
