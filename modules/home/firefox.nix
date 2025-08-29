{ pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    # Delegate profiles to dotfiles for portability
    profiles = import ../../dotfiles/firefox/profiles.nix { inherit lib; };

    # Manage extensions via dotfiles JSON using Firefox policies
    policies =
      let
        extJson = ../../dotfiles/firefox/extensions.json;
      in lib.optionalAttrs (builtins.pathExists extJson) {
        ExtensionSettings = builtins.fromJSON (builtins.readFile extJson);
      };
  };
}


