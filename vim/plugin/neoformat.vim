" augroup fmt
"   autocmd!
"   au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
" augroup END
"
" " Enable basic formatting when a filetype is not found. Disabled by default.
" let g:neoformat_basic_format_trim = 0
" let g:neoformat_basic_format_align = 0
" let g:neoformat_basic_format_retab = 0
"
" " Typescript
" let g:neoformat_enabled_typescriptreact = ['prettier']
" let g:neoformat_enabled_typescript = ['prettier']
"
" " Ruby
" let g:neoformat_enabled_ruby = ['rubocop']
