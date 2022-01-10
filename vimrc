" Leader
let mapleader = " "

" set wildignore+=*.DS_Store
" set wildignore+=*_build/*
" set wildignore+=**/coverage/*
" set wildignore+=**/node_modules/*
" set wildignore+=**/android/*
" set wildignore+=**/ios/*
" set wildignore+=**/.git/*

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
" if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"   runtime! macros/matchit.vim
" endif

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use d"<CR>
nnoremap <Right> :echoe "Use a"<CR>
nnoremap <Up> :echoe "Use w"<CR>
nnoremap <Down> :echoe "Use s"<CR>

" Keep the cursor centered, when jumping though searches.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Have more granular break points for undo's
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap > ><c-g>u

" Easy moving of lines in visual mode
" First, move the line, and then apply indentation, and apply visual selection.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Always use vertical diffs
" set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
