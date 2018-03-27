" <Leader>l - toggle highlighting long lines
nnoremap <silent> <Leader>l
\ :if exists('w:long_line_match') <Bar>
\   silent! call matchdelete(w:long_line_match) <Bar>
\   unlet w:long_line_match <Bar>
\ elseif &textwidth > 0 <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
\ else <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
\ endif<CR>

