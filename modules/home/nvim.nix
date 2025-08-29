{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    # defaultEditor = true;

    # Runtime dependencies: LSPs, formatters, linters, debuggers, and tools
    extraPackages = with pkgs; [
      # Core tools
      ripgrep
      fd
      git
      curl
      unzip
      gcc
      just

      # Language servers
      rust-analyzer
      clang-tools                                # C/C++ LSP (clangd)
      pyright                                    # Python LSP
      bash-language-server                       # Bash LSP
      nixd                                       # Nix LSP
      lua-language-server                        # Lua LSP
      nodePackages.typescript-language-server    # TS/JS LSP
      nodePackages.vscode-langservers-extracted  # HTML/CSS/JSON LSP
      perlnavigator                              # Perl LSP
      just-lsp                       # Justfile LSP

      # Formatters
      rustfmt
      black
      isort
      shfmt
      nixfmt-rfc-style
      nodePackages.prettier
      stylua
      # clang-format provided by clang-tools
      perl540Packages.PerlTidy

      # Linters
      shellcheck
      nodePackages.eslint
      python312Packages.flake8
      # Nix linting handled by built-in tools; external linter optional

      # Debuggers
      gdb
      lldb
      python3Packages.debugpy
      nodejs
    ];

    # Plugin set (managed by Nix; loading orchestrated by lazy.nvim in Lua)
    plugins = with pkgs.vimPlugins; [
      # Core deps
      plenary-nvim
      nvim-web-devicons
      lazy-nvim

      # Theme and UI
      neovim-ayu                   # Ayu theme for Neovim
      lualine-nvim
      which-key-nvim
      vim-just                     # Justfile syntax & ft detection

      # File explorer and navigation
      nvim-tree-lua
      telescope-nvim
      telescope-fzf-native-nvim

      # LSP and completion
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip
      friendly-snippets
      lsp_signature-nvim

      # Treesitter
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      nvim-treesitter-context

      # Git
      gitsigns-nvim
      fugitive

      # Editing
      nvim-surround
      comment-nvim
      nvim-autopairs
      indent-blankline-nvim
      trouble-nvim

      # Formatting and linting
      conform-nvim
      nvim-lint

      # Language extras
      rust-tools-nvim
      crates-nvim

      # Utilities
      fidget-nvim
      vim-sleuth
    ];
  };

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
