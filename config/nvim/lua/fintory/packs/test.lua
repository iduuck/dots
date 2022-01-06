local K = require('fintory.keymap')

K.n('<silent> <Leader>t', '<CMD>TestFile<CR>')
K.n('<silent> <Leader>s', '<CMD>TestNearest<CR>')
K.n('<silent> <Leader>l', '<CMD>TestLast<CR>')
K.n('<silent> <Leader>a', '<CMD>TestSuite<CR>')
K.n('<silent> <Leader>gt', '<CMD>TestVisit<CR>')
