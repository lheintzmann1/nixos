local aug = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

local group = aug('init_autocmds', { clear = true })

-- Highlight on yank
au('TextYankPost', {
  group = group,
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 120 })
  end,
})

-- Use relative number in normal mode only
au({ 'InsertEnter' }, {
  group = group,
  callback = function()
    vim.opt.relativenumber = false
  end,
})
au({ 'InsertLeave' }, {
  group = group,
  callback = function()
    vim.opt.relativenumber = true
  end,
})


