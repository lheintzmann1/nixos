{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      save = 10000;
      share = true;
      extended = true;
    };

    # Use external dotfiles for zshrc content
    initExtra = builtins.readFile ../../dotfiles/zsh/zshrc;
  };

  # Useful tools for zsh
  home.packages = with pkgs; [
    zoxide
    fzf
  ];
}

