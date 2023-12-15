return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = "catppuccin",
        component_separators = '',
        section_separators = { left = '', right = '' },
        icons_enabled = true,
        disabled_filetypes = {
          'neo-tree',
          'NeogitStatus',
        }
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
          { 'branch' },
          { 'diff',  colored = false },
        },
        lualine_c = { 'filename', 'aerial', 'diagnostics' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
    })
  end
}
