
-- Oil.nvim file explorer
require("oil").setup({
  default_file_explorer = true,
  view_options = {
    show_hidden = true
  },
  columns = {
    "icon",
    "permissions",
    "size",
  },
})

-- Disable netrw in favor of oil
vim.g.loaded_netrwPlugin = 1

-- Oil keymaps
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = 'Open Parent Directory' })
vim.keymap.set("n", "<leader>E", "<cmd>Oil .<CR>", { desc = 'Open nvim root directory' })

-- Surround
require('nvim-surround').setup({})

-- Comment
require('Comment').setup({})

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree' })

-- Indent blankline
require('ibl').setup({
  indent = {
    char = "┊",
  },
})

-- Formatting with conform
require('conform').setup({
  formatters_by_ft = {
    rust = { "rustfmt" },
    python = { "black", "isort" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    nix = { "nixfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Linting with nvim-lint
require('lint').linters_by_ft = {
  python = { 'flake8' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  sh = { 'shellcheck' },
  bash = { 'shellcheck' },
}

-- Auto-lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Format keymap
vim.keymap.set('n', '<leader>f', function()
  require('conform').format({ async = true, lsp_fallback = true })
end, { desc = 'Format buffer' })
