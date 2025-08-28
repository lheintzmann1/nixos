require('nvim-tree').setup({
  view = { width = 32 },
  renderer = {
    icons = { glyphs = { folder = { arrow_closed = '', arrow_open = '' } } },
  },
  filters = { dotfiles = false },
  git = { enable = true },
})


