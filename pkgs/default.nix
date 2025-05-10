
{ pkgs }:

{
  systemPackages = with pkgs; [
    # Gnome
    gnome-extension-manager
    gnome-tweaks
    gnomeExtensions.gtk4-desktop-icons-ng-ding

    # Misc.
    ntfs3g
    os-prober
    fastfetch

    # CLI
    gh
    git
    git-lfs

    alacritty

    obsidian
  ];

}
