{ config, lib, pkgs, ... }:

{
  # Install Emacs with Doom for note-taking only
  programs.emacs = {
    enable = true;
    package = pkgs.emacsPackages.doom;
  };

  home = {
    packages = with pkgs; [
      # Fonts/icons that help some themes/UI
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono

      # Org ecosystem helpers
      ripgrep
      fd
      git
    ];

    # Place Doom config files from dotfiles
    file.".doom.d/config.el".source = ../../dotfiles/emacs/config.el;
    file.".doom.d/init.el".source = ../../dotfiles/emacs/init.el;
    file.".doom.d/packages.el".source = ../../dotfiles/emacs/packages.el;

    # Ensure common note-taking directories exist
    file."org/agenda/.keep".text = "";
    file."org/media/.keep".text = "";
  };

  # Ensure org directory exists
  home.file."org/.keep" = {
    text = "";
  };

  home.activation = {
    # Sync Doom after generation so packages are installed
    doomSync = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if command -v doom >/dev/null 2>&1; then
        echo "Running: doom sync --no-install --quiet"
        doom sync --no-install --quiet || true
      fi
    '';
  };
}


