local K = require('fintory.keymap')

return {
  "tpope/vim-fugitive",
  config = function()
    K.n('<leader>gs', '<cmd>Git<CR>')
    K.n('<leader>gp', '<cmd>Git push<CR>')
    K.n('<leader>gup', '<cmd>Git pull --rebase<CR>')
  end
}
