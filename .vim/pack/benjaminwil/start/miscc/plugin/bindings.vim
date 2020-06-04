" Bs
" view buffer list and prompt for buffer number input
nnoremap Bs :buffers<cr>:b

" <leader>eD
" <leader>ed
" <leader>edm
" template date and datetime filenames because bloggin'
nnoremap <expr> <leader>eD  ':e ' . strftime("%Y-%m-%d")
nnoremap <expr> <leader>ed  ':e ' . strftime("%Y-%m-%d-%H%M")

" <leader>gr
" open ripgrep results for current word under cursor as quickfix window
nnoremap <silent> <expr> <leader>gr
      \ ':cexpr system("rg --vimgrep '
      \ . expand("<cword>") . ' *") \| cw<cr>'

" BS
" create a (vertical) scratch buffer
nnoremap BS :call ScratchPad()<cr>

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
