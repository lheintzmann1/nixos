local rt = require('rust-tools')

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<leader>rr', rt.runnables.runnables, { buffer = bufnr })
    end,
  },
})


