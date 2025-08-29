local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Diagnostics
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = '●' },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local function on_attach(client, bufnr)
  local bufmap = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
  end
  bufmap('n', 'gd', vim.lsp.buf.definition)
  bufmap('n', 'gr', vim.lsp.buf.references)
  bufmap('n', 'gi', vim.lsp.buf.implementation)
  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', '<leader>rn', vim.lsp.buf.rename)
  bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
end

-- Servers installed via Nix (extraPackages)
local servers = {
  'rust_analyzer',
  'clangd',
  'pyright',
  'bashls',
  'nixd',
  'lua_ls',
  'ts_ls',
  'html',
  'cssls',
  'perlnavigator',
  'just',
}

-- Lua: configure workspace for Neovim
local lua_settings = {
  Lua = {
    diagnostics = { globals = { 'vim' } },
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  },
}

for _, server in ipairs(servers) do
  local opts = { on_attach = on_attach, capabilities = capabilities }
  if server == 'lua_ls' then
    opts.settings = lua_settings
  end
  lspconfig[server].setup(opts)
end

-- Signature help
require('lsp_signature').setup({ hint_enable = true })


