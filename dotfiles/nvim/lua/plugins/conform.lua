local conform = require('conform')

conform.setup({
  format_on_save = function(bufnr)
    return { lsp_fallback = true, timeout_ms = 2000 }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black', 'isort' },
    rust = { 'rustfmt' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    nix = { 'nixfmt' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    perl = { 'perltidy' },
  },
})


