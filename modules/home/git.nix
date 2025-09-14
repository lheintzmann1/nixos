{ lib, config, ... }:

{
  programs.git = {
    enable = true;
  };
  
  programs.gh = {
    enable = true;
  };

  # Source Git and GH configs from dotfiles
  xdg.configFile."git/config".source = ../../dotfiles/git/gitconfig;
  xdg.configFile."git/ignore".source = ../../dotfiles/git/gitignore;
  home.file.".gitconfig".source = ../../dotfiles/git/gitconfig; # ensure Git sees it if XDG isn't used
}
