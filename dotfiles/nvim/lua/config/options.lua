
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = false

-- Mouse and clipboard
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = 'split'

-- Display
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.scrolloff = 10
opt.termguicolors = true
opt.signcolumn = 'yes'

-- Files and backups
opt.undofile = true
opt.backup = false
opt.swapfile = false

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = 'menu,menuone,noselect'

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Cursor
vim.o.cursorline = true

-- Folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false

-- Manual format on save for specific filetypes only
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.lua", "*.nix" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Disable auto comment on new line
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})
