{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      bbenoist.nix
      mshr-h.veriloghdl
#      teros-technology.teroshdl
      visualstudioexptteam.vscodeintellicode
      christian-kohler.path-intellisense
      github.copilot
    ];
    userSettings = {
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      "editor.fontSize" = 12;
      "editor.tabSize" = 2;
      "editor.formatOnSave" = true;
      "window.zoomLevel" = 1;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "telemetry.telemetryLevel" = "off";
    };
  };
}
