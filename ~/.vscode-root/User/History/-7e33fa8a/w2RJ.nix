{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "lheintzmann1";
    userEmail = "lheintzmann1@disroot.org";
    
    extraConfig = {
      init.defaultBranch = "main";
      push.default = "simple";
      pull.rebase = true;
      rerere.enabled = true;
      
      # Améliorer les performances
      core.preloadindex = true;
      core.fscache = true;
      gc.auto = 256;
    };
    
    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
      };
    };
  };
  
  programs.gh = {
    enable = true;
    settings = {
      editor = "code";
      protocol = "https";
    };
  };
}