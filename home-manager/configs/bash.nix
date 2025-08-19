{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "ignoredups" "ignorespace" ];
    historySize = 10000;
    
    shellAliases = {
      # NixOS
      # nrs = "sudo nixos-rebuild switch --flake /etc/nixos";
      # nrt = "sudo nixos-rebuild test --flake /etc/nixos";
      # nrb = "sudo nixos-rebuild boot --flake /etc/nixos";
      
      # Git
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
      
      # Utils
      ls = "eza";
      ll = "eza -la --git";
      la = "eza -a";
      l = "eza -l";
      tree = "eza --tree";
      cat = "bat";
      grep = "rg";
      find = "fd";
    };
    
    bashrcExtra = ''
      # Custom prompt
      export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      
      # Env variables
      export EDITOR="code"
      export BROWSER="firefox"
      export TERMINAL="alacritty"
    '';
  };
}