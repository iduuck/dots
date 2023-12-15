-- Reload configuration
vim.keymap.set("n", '<Leader><CR>', '<cmd>so ~/.config/nvim/init.vim<CR>')

-- Quick buffer switch
vim.keymap.set("n", '<Leader><Leader>', '<C-^>')

-- Paste, without sacrficing the paste-register
vim.keymap.set("x", "<Leader>p", "\"_dP")

-- Remap arrow keys for consistent navigation
vim.keymap.set("n", '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set("n", '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set("n", '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set("n", '<Down>', ':echoe "Use j"<CR>')

-- Simply stay in insert mode
vim.keymap.set("v", '>', '>gv')
vim.keymap.set("v", '<', '<gv')

-- Keep cursor position when navigating
vim.keymap.set("n", 'n', 'nzzzv')
vim.keymap.set("n", 'N', 'Nzzzv')
vim.keymap.set("n", 'J', 'mzJ`z')

-- Have more granular break points for undo's
vim.keymap.set("i", ',', ',<c-g>u')
vim.keymap.set("i", '.', '.<c-g>u')
vim.keymap.set("i", '!', '!<c-g>u')
vim.keymap.set("i", '?', '?<c-g>u')
vim.keymap.set("i", '>', '><c-g>u')

-- Easy moving of lines in visual mode
-- First, move the line, and then apply indentation, and apply visual selection.
vim.keymap.set("x", 'J', ":move '>+1<CR>gv=gv")
vim.keymap.set("x", 'K', ":move '<-2<CR>gv=gv")

vim.keymap.set("n", '<C-h>', '<C-w>h')
vim.keymap.set("n", '<C-j>', '<C-w>j')
vim.keymap.set("n", '<C-k>', '<C-w>k')
vim.keymap.set("n", '<C-l>', '<C-w>l')

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y')
