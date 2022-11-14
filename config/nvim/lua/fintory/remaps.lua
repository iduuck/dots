local K = require('fintory.keymap')

-- Reload configuration
K.n('<Leader><CR>', '<cmd>so ~/.config/nvim/init.vim<CR>')

-- Quick buffer switch
K.n('<Leader><Leader>', '<C-^>')

-- Paste, without sacrficing the paste-register
K.x("<Leader>p", "\"_dP")

-- Remap arrow keys for consistent navigation
K.n('<Left>', ':echoe "Use h"<CR>')
K.n('<Right>', ':echoe "Use l"<CR>')
K.n('<Up>', ':echoe "Use k"<CR>')
K.n('<Down>', ':echoe "Use j"<CR>')

-- Simply stay in insert mode
K.v('>', '>gv')
K.v('<', '<gv')

-- Keep cursor position when navigating
K.n('n', 'nzzzv')
K.n('N', 'Nzzzv')
K.n('J', 'mzJ`z')

-- Have more granular break points for undo's
K.i(',', ',<c-g>u')
K.i('.', '.<c-g>u')
K.i('!', '!<c-g>u')
K.i('?', '?<c-g>u')
K.i('>', '><c-g>u')

-- Easy moving of lines in visual mode
-- First, move the line, and then apply indentation, and apply visual selection.
K.x('J', ":move '>+1<CR>gv=gv")
K.x('K', ":move '<-2<CR>gv=gv")

K.n('<C-h>', '<C-w>h')
K.n('<C-j>', '<C-w>j')
K.n('<C-k>', '<C-w>k')
K.n('<C-l>', '<C-w>l')

-- LSP saga code actions
K.n('<Leader>cca', '<cmd>Lspsaga code_action<CR>')
K.n('<Leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
K.n('<Leader>crn', '<cmd>Lspsaga rename<CR>')

-- Tree
K.n('<Leader>ee', '<cmd>NvimTreeToggle<CR>')
