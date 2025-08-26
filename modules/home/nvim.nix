{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Runtime deps: LSPs, formatters, linters, CLIs
    extraPackages = with pkgs; [
      ripgrep fd git

      rust-analyzer
      bash-language-server
      nixd
      nodePackages.typescript-language-server
      lua-language-server

      rustfmt clippy shellcheck shfmt
      nixfmt-rfc-style
      nodePackages.prettier
      nodePackages.eslint
      black isort
    ];

    # Plugin list
    plugins = with pkgs.vimPlugins; [
      # Core
      plenary-nvim
      nvim-web-devicons
      nvim-notify

      # UI
      neovim-ayu
      which-key-nvim

      # LSP / Git
      nvim-lspconfig
      gitsigns-nvim
      vim-fugitive

      # Completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip
      friendly-snippets

      # Treesitter
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects

      # Telescope / file nav
      telescope-nvim
      telescope-fzf-native-nvim
      oil-nvim

      # Editing
      nvim-surround
      comment-nvim
      undotree
      indent-blankline-nvim

      # Formatting & linting
      conform-nvim
      nvim-lint
      fidget-nvim

      # Rust
      rust-tools-nvim
      crates-nvim
    ];
  };

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
