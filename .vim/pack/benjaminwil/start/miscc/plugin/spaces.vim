" <leader>w - kill spaces at the ends of lines
nnoremap <silent> <leader>w :let _save_pos=getpos(".") <bar>
\ :let _s=@/ <bar>
\ :%s/\s\+$//e <bar>
\ :let @/=_s <bar>
\ :nohl <bar>
\ :unlet _s<bar>
\ :call setpos('.', _save_pos)<bar>
\ :unlet _save_pos<cr><cr>
