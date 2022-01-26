" Bs
" view buffer list in a location-list split
nnoremap Bs :call OpenBufferSwitcher()<cr>

" <leader>eD
" <leader>ed
" template date and datetime filenames because blogging
nnoremap <expr> <leader>eD  ':e ' . strftime("%Y-%m-%d")
nnoremap <expr> <leader>ed  ':e ' . strftime("%Y-%m-%d-%H%M")

" <leader>gr
" open ripgrep results for visual selection. if no, visual selection, prompt
" user for regular expression query
nnoremap <leader>ff :call RgProjectSearch()<cr>

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

" <leader>t
" <leader>T
" Run the RSpec test under cursor (`t`), or the current file (`T`)
" (.vim/pack/benjaminwil/miscc/testrunner.vim)
nnoremap <silent> <leader>t :call RSpecRunForCurrentFile(1)<cr>
nnoremap <silent> <leader>T :call RSpecRunForCurrentFile()<cr>
