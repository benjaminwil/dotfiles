" my own custom keybindings and functions

" fzf / rg
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" goyo configuration
let g:goyo_width=100
let g:goyo_height=60
let g:goyo_linenr=1
nnoremap <Leader>g :Goyo<CR>

function! s:goyo_enter()
  set nowrap
  set number
  hi LineNr ctermfg=8 ctermbg=none
endfunction

function! s:goyo_leave()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" notes and todo formatting (depends on vim-markdown)
if @% =~# 'NOTES' || @% =~# 'TODO'
  let g:markdown_folding=1
endif

" open-browser plugin settings
if has("mac")
  let g:netrw_nogx=1
  nmap gx <Plug>(openbrowser-smart-search) 
  vmap gx <Plug>(openbrowser-smart-search) 
endif

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

" <Leader>w - kill spaces at the ends of lines
nnoremap <Leader>w :let _save_pos=getpos(".") <Bar>
\ :let _s=@/ <Bar>
\ :%s/\s\+$//e <Bar>
\ :let @/=_s <Bar>
\ :nohl <Bar>
\ :unlet _s<Bar>
\ :call setpos('.', _save_pos)<Bar>
\ :unlet _save_pos<CR><CR>

" remap backspace to x in normal mode
nnoremap <BS> X
