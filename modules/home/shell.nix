{ ... }: {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      historyControl = [ "ignoredups" "ignorespace" ];
      historySize = 10000;
      bashrcExtra = builtins.readFile ../../dotfiles/shell/bashrc;
    };
  };
}