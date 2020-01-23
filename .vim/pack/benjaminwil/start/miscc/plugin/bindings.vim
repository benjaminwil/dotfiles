" Bs
" view buffer list and prompt for buffer number input
nnoremap Bs :buffers<cr>:b

" <leader>a
" <leader>aa
" switch to file alternates (.vim/pack/plugins/projectionist)
nnoremap <leader>a :AV<cr>
nnoremap <leader>aa :A<cr>

" <leader>D
" call Dispatch test runner (.vim/pack/plugins/dispatch)
nnoremap <leader>D :Dispatch<cr>

" <leader>fe
" <leader>fv
" ripgrep-fzy file search (.vim/pack/benjaminwil/frgzy)
nnoremap <leader>fe :call RgFzyFileSearch(':e')<cr>
nnoremap <leader>fv :call RgFzyFileSearch(':vs')<cr>

" <leader>re
" <leader>rv
" ripgrep-fzy glob search (.vim/pack/benjaminwil/frgzy)
nnoremap <leader>re :call RgFzyGlobSearch(':e')<cr>
nnoremap <leader>rv :call RgFzyGlobSearch(':vs')<cr>

" <leader>w
" save current file
nnoremap <leader>w :w<cr>
