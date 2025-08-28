{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    # Runtime dependencies: LSPs, formatters, linters, debuggers, and tools
    extraPackages = with pkgs; [
      # Core tools
      ripgrep
      fd
      git
      tree-sitter
      curl
      unzip
      gcc

      # Language servers
      rust-analyzer
      clang-tools                    # C/C++ LSP (clangd)
      pyright                        # Python LSP
      bash-language-server           # Bash LSP
      nixd                          # Nix LSP
      lua-language-server           # Lua LSP
      nodePackages.typescript-language-server  # TS/JS LSP
      nodePackages.vscode-langservers-extracted  # HTML/CSS/JSON LSP
      perl-language-server          # Perl LSP

      # Formatters
      rustfmt                       # Rust formatter
      black                         # Python formatter
      isort                         # Python import formatter
      autopep8                      # Python formatter
      shfmt                         # Shell formatter
      nixfmt-rfc-style             # Nix formatter
      nodePackages.prettier        # JS/TS/HTML/CSS formatter
      stylua                        # Lua formatter
      clang-tools                   # C formatter (clang-format)
      perltidy                      # Perl formatter

      # Linters
      shellcheck                    # Shell linter
      nodePackages.eslint          # JS/TS linter
      flake8                        # Python linter
      pylint                        # Python linter
      mypy                          # Python type checker
      clippy                        # Rust linter
      nixpkgs-fmt                   # Nix linter
      perl-critic                   # Perl linter

      # Debuggers
      gdb                           # C/C++ debugger
      lldb                          # Alternative C/C++ debugger
      python3Packages.debugpy       # Python debugger
      nodejs                        # Node.js for JS/TS debugging
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
      vim-perl
      vim-nix

      # Utilities
      fidget-nvim
      vim-sleuth
    ];
  };

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
