require('lualine').setup({
  options = {
    theme = 'ayu_dark',
    icons_enabled = true,
    globalstatus = true,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    -- Remove fileformat to avoid Windows icon when editing CRLF files
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})


