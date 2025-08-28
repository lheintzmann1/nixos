local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
    prompt_prefix = '   ',
  },
})

pcall(telescope.load_extension, 'fzf')


