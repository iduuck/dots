set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

source ~/.vimrc

lua require("fintory")
