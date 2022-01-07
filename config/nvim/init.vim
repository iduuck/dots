set wildignore+=*.DS_Store
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildignore+=**/.next/*

" Load all the lua stuff in our config folder.
lua require("fintory")
