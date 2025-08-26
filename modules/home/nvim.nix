{ inputs, pkgs, ... }: {
  imports = [ inputs.nixCats.homeModules.default ];

  nixCats = {
    enable = true;
    packageNames = [ "nixCats" ];
    luaPath = toString ../../dotfiles/nvim/lua;
    
    categoryDefinitions = { pkgs, settings, categories, extra, name, mkPlugin, ... }: {
      # LSPs and development tools
      lspsAndRuntimeDeps = {
        # Essential tools
        general = with pkgs; [
          ripgrep
          fd
          # Language servers
          rust-analyzer
          bash-language-server
          nixd
          nodePackages.typescript-language-server
          python311Packages.python-lsp-server
          # Formatters and linters
          rustfmt
          clippy
          shellcheck
          shfmt
          nixfmt-rfc-style
          nodePackages.prettier
          nodePackages.eslint
          black
          isort
        ];
      };

      # Essential plugins that load immediately
      startupPlugins = {
        always = with pkgs.vimPlugins; [
          # Core functionality
          plenary-nvim
          nvim-web-devicons
          nvim-notify
          
          # UI and visual
          lualine-nvim
          neovim-ayu
          which-key-nvim
          
          # Essential editing
          vim-sleuth
          gitsigns-nvim
          nvim-lspconfig
        ];
      };

      # Lazy-loaded plugins
      optionalPlugins = {
        general = with pkgs.vimPlugins; [
          # Completion
          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          luasnip
          cmp_luasnip
          friendly-snippets
          
          # Syntax and parsing
          nvim-treesitter.withAllGrammars
          nvim-treesitter-textobjects
          
          # File navigation
          telescope-nvim
          telescope-fzf-native-nvim
          oil-nvim
          
          # Editing enhancements
          nvim-surround
          comment-nvim
          undotree
          indent-blankline-nvim
          
          # Git integration
          vim-fugitive
          
          # Formatting and linting
          conform-nvim
          nvim-lint
          fidget-nvim
          
          # Language-specific
          rust-tools-nvim
          crates-nvim
          markdown-preview-nvim
        ];
      };

      environmentVariables = {
        general = { EDITOR = "nvim"; };
      };

      sharedLibraries = {
        general = with pkgs; [];
      };
    };

    packageDefinitions = {
      nixCats = { pkgs, name, ... }: {
        settings = {
          wrapRc = true;
          aliases = [ "vim" "vi" ];
        };
        
        categories = {
          always = true;
          general = true;
          colorscheme = "ayu";
        };
      };
    };
  };
}