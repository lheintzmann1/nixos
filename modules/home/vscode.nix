{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {    
	    extensions = with pkgs.vscode-extensions; [
        # Language Support
        ms-python.python
        bbenoist.nix
        
        # AI & Code Intelligence
        visualstudioexptteam.vscodeintellicode
        github.copilot
        
        # Navigation & Productivity
        christian-kohler.path-intellisense
        
        # Themes
        teabyii.ayu

        # Icons
        vscode-icons-team.vscode-icons
      ];
    };
  };

  # Source VSCode user config from dotfiles
  xdg.configFile."Code/User/settings.json".source = ../../dotfiles/vscode/settings.json;
  xdg.configFile."Code/User/keybindings.json".source = ../../dotfiles/vscode/keybindings.json;
}
