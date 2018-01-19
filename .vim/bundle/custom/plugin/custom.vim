" my own custom keybindings and functions

" remap backspace to x in normal mode
nnoremap <BS> X

" goyo configuration
let g:goyo_width=100
let g:goyo_height=60
let g:goyo_linenr=1

function! s:goyo_enter()
  set nowrap
  set number
  hi LineNr          ctermfg=181   ctermbg=237
endfunction

function! s:goyo_leave()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" open-browser plugin settings
if has("mac")
  let g:netrw_nogx=1
  nmap gx <Plug>(openbrowser-smart-search) 
  vmap gx <Plug>(openbrowser-smart-search) 
endif

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
