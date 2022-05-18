local K = require('fintory.keymap')

-- let test#strategy = "dispatch"
vim.g['test#strategy'] = "dispatch"

K.n('<Leader>t', '<CMD>TestFile<CR>')
K.n('<Leader>s', '<CMD>TestNearest<CR>')
K.n('<Leader>l', '<CMD>TestLast<CR>')
K.n('<Leader>a', '<CMD>TestSuite<CR>')
K.n('<Leader>gt', '<CMD>TestVisit<CR>')
