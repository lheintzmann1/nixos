-- Bootstrap lazy.nvim if needed (plugin provided by Nix; just ensure runtime path)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Core settings
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- Plugins via lazy
require('lazy').setup({
  spec = {
    { 'Shatur/neovim-ayu', config = function() require('plugins.theme') end },
    { 'nvim-tree/nvim-web-devicons', config = function() require('plugins.devicons') end },
    { 'nvim-lualine/lualine.nvim', config = function() require('plugins.lualine') end, dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'folke/which-key.nvim', config = function() require('plugins.whichkey') end },

    -- Navigation
    { 'nvim-tree/nvim-tree.lua', config = function() require('plugins.nvimtree') end, dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'nvim-telescope/telescope.nvim', config = function() require('plugins.telescope') end, dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' } },

    -- LSP and completion
    { 'neovim/nvim-lspconfig', config = function() require('plugins.lsp') end },
    { 'hrsh7th/nvim-cmp', config = function() require('plugins.cmp') end, dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' } },
    { 'ray-x/lsp_signature.nvim' },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', config = function() require('plugins.treesitter') end, build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context', config = function() require('plugins.tscontext') end },

    -- Git
    { 'lewis6991/gitsigns.nvim', config = function() require('plugins.gitsigns') end },
    { 'tpope/vim-fugitive' },

    -- Editing
    { 'kylechui/nvim-surround', config = function() require('plugins.surround') end },
    { 'numToStr/Comment.nvim', config = function() require('plugins.comment') end },
    { 'windwp/nvim-autopairs', config = function() require('plugins.autopairs') end },
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', config = function() require('plugins.indent') end },
    { 'folke/trouble.nvim', config = function() require('plugins.trouble') end, dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- Formatting and linting
    { 'stevearc/conform.nvim', config = function() require('plugins.conform') end },
    { 'mfussenegger/nvim-lint', config = function() require('plugins.lint') end },

    -- Language extras
    { 'simrat39/rust-tools.nvim', config = function() require('plugins.rust') end },
    { 'Saecki/crates.nvim', event = { 'BufRead Cargo.toml' }, config = function() require('plugins.crates') end },
    { 'LnL7/vim-nix' },
    { 'vim-perl/vim-perl' },

    -- Utilities
    { 'j-hui/fidget.nvim', tag = 'legacy', config = function() require('plugins.fidget') end },
    { 'tpope/vim-sleuth' },
  },
  checker = { enabled = false },
  change_detection = { enabled = false },
})


