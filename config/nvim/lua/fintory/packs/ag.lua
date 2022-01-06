local K = require('fintory.keymap')

-- Set default grep programm
vim.o.grepprg = 'ag --nogroup --nocolor'
vim.g.ackprg = 'ag --nogroup --nocolor'

-- Set some fzf options
vim.env.FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

-- Implement shortcut for silver searcher
K.n('\\', ':Ack<SPACE>')
