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

