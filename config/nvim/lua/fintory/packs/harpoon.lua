return {
  'ThePrimeagen/harpoon',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('harpoon').setup {}

    vim.keymap.set('n', '<leader>hl', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>',
      { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<cr>',
      { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hn', '<cmd>lua require("harpoon.ui").nav_next()<cr>',
      { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hp', '<cmd>lua require("harpoon.ui").nav_prev()<cr>',
      { noremap = true, silent = true })
  end
}
