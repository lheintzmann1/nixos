local lint = require('lint')

lint.linters_by_ft = {
  sh = { 'shellcheck' },
  bash = { 'shellcheck' },
  python = { 'flake8' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  nix = { 'nix' },
  lua = {},
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    lint.try_lint()
  end,
})


