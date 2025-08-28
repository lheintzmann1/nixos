{ inputs, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./nvim.nix
    ./bash.nix
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
  
  # GTK theming
  gtk = {
    enable = true;
    theme = { name = "Adwaita-dark"; package = pkgs.gnome-themes-extra; };
    iconTheme = { name = "WhiteSur-dark"; package = pkgs.whitesur-icon-theme; };
    cursorTheme = { name = "WhiteSur-cursors"; package = pkgs.whitesur-cursors; };
  };
}