local K = require('fintory.keymap')

-- Reload configuration
K.n('<Leader><CR>', '<cmd>so ~/.config/nvim/init.vim<CR>')

-- Quick buffer switch
K.n('<Leader><Leader>', '<C-^>')

-- Remap arrow keys for consistent navigation
K.n('<Left>', ':echoe "Use h"<CR>')
K.n('<Right>', ':echoe "Use l"<CR>')
K.n('<Up>', ':echoe "Use k"<CR>')
K.n('<Down>', ':echoe "Use j"<CR>')

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
K.v('J', '<cmd>m \'>+1<CR>gv=gv')
K.v('K', '<cmd>m \'<-2<CR>gv=gv')

-- LSP saga code actions
K.n('<Leader>cca', '<cmd>Lspsaga code_action<CR>')
K.n('<Leader>crn', '<cmd>Lspsaga rename<CR>')
