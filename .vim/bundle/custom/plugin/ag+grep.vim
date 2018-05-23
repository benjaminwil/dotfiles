set grepprg=ag\ --only-matching\ --vimgrep\ $*
set grepformat=%f

nnoremap <leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>d :Ag<SPACE>
