require('lualine').setup({
  options = {
    component_separators = '',
    section_separators = { left = '', right = ''},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch' },
      { 'diff', colored = false },
    },
    lualine_c = { 'filename', 'diagnostics' },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', color = { gui = 'bold' } },
    },
  },
})
