set grepprg=ag\ --only-matching\ --vimgrep\ $*

nnoremap <leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|resize 10|set nowrap|redraw!
nnoremap <leader>d :Ag<SPACE>
