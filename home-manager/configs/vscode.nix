{ config, pkgs, ... }:

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
      userSettings = {
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "editor.fontSize" = 12;
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "window.zoomLevel" = 1;
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
        "telemetry.telemetryLevel" = "off";
        "workbench.iconTheme" = "vscode-icons";
        "workbench.colorTheme" = "Ayu Dark";
      };
    };
  };
}
