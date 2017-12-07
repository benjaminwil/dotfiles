" my own custom keybindings and functions

" replace common punctuation
iabbrev <buffer> --- –
iabbrev <buffer> ---- —
iabbrev <buffer> << «
iabbrev <buffer> >> »

" remap backspace to x in normal mode
nnoremap <BS> X

" highlight long lines with <Leader>l
nnoremap <silent> <Leader>l
\ :if exists('w:long_line_match') <Bar>
\   silent! call matchdelete(w:long_line_match) <Bar>
\   unlet w:long_line_match <Bar>
\ elseif &textwidth > 0 <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
\ else <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
\ endif<CR>

" kill extra spaces with <Leader>w
nnoremap <Leader>w :let _save_pos=getpos(".") <Bar>
\ :let _s=@/ <Bar>
\ :%s/\s\+$//e <Bar>
\ :let @/=_s <Bar>
\ :nohl <Bar>
\ :unlet _s<Bar>
\ :call setpos('.', _save_pos)<Bar>
\ :unlet _save_pos<CR><CR>
