set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Reload init.vim file. 
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Source the initial vimrc (keeps support for normal vim)
source ~/.vimrc

" Load all the lua stuff in our config folder.
lua require("fintory")
