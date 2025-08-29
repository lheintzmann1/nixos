{ inputs, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./git.nix
    ./nvim.nix
    ./starship.nix
    ./vscode.nix
    ./zsh.nix
  ];
  
  home = {
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "code";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
    };
  };
  
  programs = {
    home-manager.enable = true;
    eza.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
  };

  # Shared shell aliases file, used by both Bash and Zsh
  home.file.".bash_aliases".source = ../../dotfiles/bash/bash_aliases;
  
  # GTK theming
  gtk = {
    enable = true;
    theme = { name = "Adwaita-dark"; package = pkgs.gnome-themes-extra; };
    iconTheme = { name = "WhiteSur-dark"; package = pkgs.whitesur-icon-theme; };
    cursorTheme = { name = "WhiteSur-cursors"; package = pkgs.whitesur-cursors; };
  };
}