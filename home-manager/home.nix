{ config, pkgs, ... }:

{
  imports = [
    ./configs/alacritty.nix
    ./configs/vscode.nix
];

home = {
    username = "lucas";
    homeDirectory = "/home/lucas";
    stateVersion = "24.11";

  sessionVariables = {
    # EDITOR = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  packages = with pkgs; [

  ];
};

programs = {
  home-manager.enable = true;
  bash.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
  };
};

}
