{ pkgs, ... }:

{
  # Font configuration using the new NixOS font handling
  fonts = {
    # Enable default packages for reasonable Unicode coverage
    enableDefaultPackages = true;
    
    # Enable Ghostscript fonts for PostScript typefaces
    enableGhostscriptFonts = true;
    
    # Font packages - moved from environment.systemPackages
    packages = with pkgs; [
      # Basic fonts for good Unicode coverage
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      
      # Programming fonts
      fira-code
      fira-code-symbols
      
      # Nerd Fonts (using new syntax)
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      
      # Additional useful fonts
      inter
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      # Microsoft core fonts (includes Times New Roman)
      corefonts
    ];

    # Prefer Inter for system sans-serif (close to Segoe UI)
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Inter" "Noto Sans" "DejaVu Sans" ];
        serif = [ "Noto Serif" "DejaVu Serif" ];
        monospace = [ "JetBrainsMono Nerd Font" "DejaVu Sans Mono" ];
      };
    };
  };
}
