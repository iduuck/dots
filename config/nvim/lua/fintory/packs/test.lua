return {
  "janko-m/vim-test",
  config = function()
    -- let test#strategy = "dispatch"
    vim.g['test#strategy'] = "neovim"

    vim.keymap.set("n", '<Leader>t', '<CMD>TestFile<CR>')
    vim.keymap.set("n", '<Leader>s', '<CMD>TestNearest<CR>')
    vim.keymap.set("n", '<Leader>l', '<CMD>TestLast<CR>')
    vim.keymap.set("n", '<Leader>a', '<CMD>TestSuite<CR>')
    vim.keymap.set("n", '<Leader>gt', '<CMD>TestVisit<CR>')
  end
}
