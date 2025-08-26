
-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load core configuration
require('config.options')
require('config.keymaps')

-- Setup colorscheme
local colorschemeName = nixCats('colorscheme') or 'ayu'
if colorschemeName == 'ayu' then
  require('ayu').setup({
    mirage = false,
    terminal = true,
  })
  vim.cmd.colorscheme('ayu-dark')
else
  vim.cmd.colorscheme(colorschemeName)
end

-- Setup notifications
require("notify").setup({
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { focusable = false })
  end,
})
vim.notify = require("notify")

-- Configure plugins
require('plugins.lsp')
require('plugins.completion')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.editing')
require('plugins.git')

-- Language-specific setups (consolidated)
require('languages.setup')
