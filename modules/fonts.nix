{ config, pkgs, ... }:

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
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];
  };
}
