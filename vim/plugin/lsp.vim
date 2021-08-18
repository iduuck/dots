" Implement compe.nvim for auto completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Implement LSP saga for having an awesome UI.
nnoremap <silent><leader>clf :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>cca :Lspsaga code_action<CR>
vnoremap <silent><leader>cca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent><leader>chd :Lspsaga hover_doc<CR>
nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent><leader>csh :Lspsaga signature_help<CR>
nnoremap <silent><leader>crn :Lspsaga rename<CR>
nnoremap <silent><leader>cpd:Lspsaga preview_definition<CR>
nnoremap <silent> <leader>cld :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>
tnoremap <silent> <leader>cct <C-\><C-n>:Lspsaga close_floaterm<CR>
