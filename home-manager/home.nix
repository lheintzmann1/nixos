{ config, pkgs, inputs, ... }:

{
  imports = [
    ./configs/alacritty.nix
    ./configs/vscode.nix
    ./configs/git.nix
    ./configs/bash.nix
  ];

  home = {
    username = "lucas";
    homeDirectory = "/home/lucas";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "code";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
    };
  };

  programs = {
    home-manager.enable = true;
    
    # Moderns CLI tools
    eza.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    
    # Prompt
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        format = "$directory$git_branch$git_status$line_break$character";
        
        directory = {
          format = "[$path]($style)";
          style = "bold blue";
          truncation_length = 0;
          truncate_to_repo = false;
        };
        
        git_branch = {
          format = " on [$branch]($style)";
          style = "bold purple";
        };
        
        git_status = {
          format = "[$all_status$ahead_behind]($style)";
          style = "bold red";
          conflicted = " ⚡";
          ahead = " ⇡$\{count}";
          behind = " ⇣$\{count}";
          diverged = " ⇕⇡$\{ahead_count}⇣$\{behind_count}";
          up_to_date = "";
          untracked = " ?$\{count}";
          stashed = " $$\{count}";
          modified = " !$\{count}";
          staged = " +$\{count}";
          renamed = " »$\{count}";
          deleted = " ✘$\{count}";
        };
        
        character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[❯](bold red)";
        };
        
        # Disable other modules
        git_state.disabled = true;
        git_metrics.disabled = true;
        git_commit.disabled = true;
        package.disabled = true;
        nodejs.disabled = true;
        python.disabled = true;
        rust.disabled = true;
        java.disabled = true;
        golang.disabled = true;
        php.disabled = true;
        ruby.disabled = true;
        docker_context.disabled = true;
        kubernetes.disabled = true;
        terraform.disabled = true;
        aws.disabled = true;
        gcloud.disabled = true;
        azure.disabled = true;
        nix_shell.disabled = true;
        conda.disabled = true;
        memory_usage.disabled = true;
        cmd_duration.disabled = true;
        time.disabled = true;
        battery.disabled = true;
        status.disabled = true;
        hostname.disabled = true;
        username.disabled = true;
      };
    };
  };

  # GTK
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-icon-theme;
    };
    cursorTheme = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
      size = 24;
    };
  };

  # dconf
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita-dark";
      icon-theme = "WhiteSur-dark";
      cursor-theme = "WhiteSur-cursors";
      cursor-size = 24;
      font-name = "Cantarell 11";
      document-font-name = "Cantarell 11";
      monospace-font-name = "Source Code Pro 10";
    };
    
    "org/gnome/desktop/wm/preferences" = {
      theme = "Adwaita";
      button-layout = ":minimize,maximize,close";
      titlebar-font = "Cantarell Bold 11";
    };
    
    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = true;
    };
  };
}