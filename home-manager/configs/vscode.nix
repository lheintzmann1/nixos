{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      mshr-h.VerilogHDL
      VisualStudioExptTeam.vscodeintellicode
      christian-kohler.path-intellisense
      GitHub.copilot
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
