return {
  "janko-m/vim-test",
  config = function()
    -- let test#strategy = "dispatch"
    vim.g['test#strategy'] = "neovim"

    vim.keymap.set("n", '<Leader>tf', '<CMD>TestFile<CR>')
    vim.keymap.set("n", '<Leader>tn', '<CMD>TestNearest<CR>')
    vim.keymap.set("n", '<Leader>tl', '<CMD>TestLast<CR>')
    vim.keymap.set("n", '<Leader>ts', '<CMD>TestSuite<CR>')
    vim.keymap.set("n", '<Leader>tv', '<CMD>TestVisit<CR>')
  end
}
