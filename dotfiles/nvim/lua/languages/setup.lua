local lspconfig = require('lspconfig')

-- LSP common on_attach function
local function on_attach(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Rust
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy",
      },
      cargo = {
        features = "all",
      },
    },
  },
})

-- Rust tools setup
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      on_attach(_, bufnr)
      -- Rust-specific keymaps
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    capabilities = capabilities,
  },
})

-- Crates.nvim for Cargo.toml
require('crates').setup()

-- TypeScript/JavaScript
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Python
lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
      },
    },
  },
})

-- Bash
lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Nix
lspconfig.nixd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
