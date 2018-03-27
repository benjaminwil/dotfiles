" <Leader>w - kill spaces at the ends of lines
nnoremap <Leader>w :let _save_pos=getpos(".") <Bar>
\ :let _s=@/ <Bar>
\ :%s/\s\+$//e <Bar>
\ :let @/=_s <Bar>
\ :nohl <Bar>
\ :unlet _s<Bar>
\ :call setpos('.', _save_pos)<Bar>
\ :unlet _save_pos<CR><CR>
