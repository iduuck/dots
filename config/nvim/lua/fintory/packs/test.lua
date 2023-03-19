local K = require('fintory.keymap')

return {
  "janko-m/vim-test",
  config = function()
    -- let test#strategy = "dispatch"
    vim.g['test#strategy'] = "neovim"

    K.n('<Leader>t', '<CMD>TestFile<CR>')
    K.n('<Leader>s', '<CMD>TestNearest<CR>')
    K.n('<Leader>l', '<CMD>TestLast<CR>')
    K.n('<Leader>a', '<CMD>TestSuite<CR>')
    K.n('<Leader>gt', '<CMD>TestVisit<CR>')
  end
}
