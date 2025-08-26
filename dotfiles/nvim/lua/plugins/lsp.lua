
-- Setup fidget for LSP progress
require('fidget').setup({})

-- Setup which-key for LSP keymaps
require('which-key').setup({})

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  
  -- Rust
  {
    "rust_analyzer",
    enabled = nixCats('rust') or false,
    lsp = {
      filetypes = { "rust" },
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          checkOnSave = {
            command = "clippy",
          },
          procMacro = {
            enable = true,
          },
          -- Simplified settings for better performance
          diagnostics = {
            enable = true,
            disabled = { "unresolved-proc-macro" },
          },
        },
      },
    },
  },
  
  -- Bash
  {
    "bashls",
    enabled = nixCats('bash') or false,
    lsp = {
      filetypes = { "sh", "bash" },
    },
  },
  
  -- TypeScript/JavaScript
  {
    "tsserver",
    enabled = nixCats('javascript') or false,
    lsp = {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    },
  },
  
  -- Nix
  {
    "nixd",
    enabled = nixCats('nix') or false,
    lsp = {
      filetypes = { "nix" },
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
          formatting = {
            command = { "nixfmt" },
          },
        },
      },
    },
  },
  
  -- Python
  {
    "pylsp",
    enabled = nixCats('python') or false,
    lsp = {
      filetypes = { "python" },
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { 'W391' },
              maxLineLength = 100,
            },
            pylint = { enabled = true, executable = "pylint" },
            pyflakes = { enabled = false },
            pyls_isort = { enabled = true },
            pyls_black = { enabled = true },
          },
        },
      },
    },
  },
  
  -- Lua (if you want to configure nixCats itself)
  {
    "lua_ls",
    enabled = nixCats('nix') or false, -- Enable for nix category since we're using it in nix
    lsp = {
      filetypes = { "lua" },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = { 'vim', 'nixCats' } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    },
  },
}
