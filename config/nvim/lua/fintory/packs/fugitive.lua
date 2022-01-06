local K = require('fintory.keymap')

vim.cmd('set tags^=.git/tags')

K.n('<leader>gs', '<cmd>Git<CR>')
K.n('<leader>gp', '<cmd>Git push<CR>')
K.n('<leader>gup', '<cmd>Git up<CR>')
K.n('<leader>gc', '<cmd>Git commit<CR>')
K.n('<leader>gb', '<cmd>Git blame<CR>')
