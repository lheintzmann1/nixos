local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
map('n', '<leader>qq', ':qa!<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)

-- NvimTree
map('n', '<leader>e', function()
  vim.cmd('NvimTreeToggle')
end, opts)

-- Telescope
map('n', '<leader>ff', function()
  require('telescope.builtin').find_files()
end, opts)
map('n', '<leader>fg', function()
  require('telescope.builtin').live_grep()
end, opts)
map('n', '<leader>fb', function()
  require('telescope.builtin').buffers()
end, opts)
map('n', '<leader>fh', function()
  require('telescope.builtin').help_tags()
end, opts)

-- LSP
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'gD', vim.lsp.buf.declaration, opts)
map('n', 'gi', vim.lsp.buf.implementation, opts)
map('n', 'gr', vim.lsp.buf.references, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)

-- Diagnostics
map('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
map('n', '<leader>dn', vim.diagnostic.goto_next, opts)


