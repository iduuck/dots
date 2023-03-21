return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    'projekt0n/circles.nvim',
  },
  config = function()
    require("nvim-tree").setup {
      renderer = {
        icons = {
          show = {
            folder_arrow = false,
            git = false,
          },
          glyphs = require('circles').get_nvimtree_glyphs(),
        },
      }
    }
  end
}
