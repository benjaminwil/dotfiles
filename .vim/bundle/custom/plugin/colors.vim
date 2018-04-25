set t_Co=16 " sets the terminal to use 16 colors

if &background ==# 'dark'
  hi Boolean      cterm=none  ctermbg=none  ctermfg=3
  hi Comment      cterm=none  ctermbg=none  ctermfg=8
  hi Constant     cterm=none  ctermbg=none  ctermfg=4
  hi CursorLine   cterm=none  ctermbg=0     ctermfg=none
  hi CursorLineNr cterm=none  ctermbg=none  ctermfg=1
  hi Delimiter    cterm=none  ctermbg=none  ctermfg=1
  hi EndOfBuffer  cterm=none  ctermbg=none  ctermfg=8
  hi Identifier   cterm=none  ctermbg=none  ctermfg=15
  hi LineNr       cterm=none  ctermbg=0     ctermfg=3
  hi NonText      cterm=none  ctermbg=none  ctermfg=3
  hi Number       cterm=none  ctermbg=none  ctermfg=4
  hi PreProc      cterm=none  ctermbg=none  ctermfg=1
  hi Search       cterm=none  ctermbg=3     ctermfg=15
  hi Special      cterm=none  ctermbg=none  ctermfg=15 
  hi Statement    cterm=none  ctermbg=none  ctermfg=4 
  hi String       cterm=none  ctermbg=none  ctermfg=7
  hi Title        cterm=bold  ctermbg=none  ctermfg=1
  hi Type         cterm=none  ctermbg=none  ctermfg=7
  hi VertSplit    cterm=none  ctermbg=none  ctermfg=8
  hi Visual       cterm=none  ctermbg=15    ctermfg=8
endif

hi markdownCodeDelimiter  cterm=none ctermbg=none ctermfg=7 

" colors reference
" DARK LIGHT
" 0    8     black (grey)
" 1    9     red
" 2    10    green 
" 3    11    yellow
" 4    4    purple 
" 5    13    pink
" 6    14    cyan
" 7    15    white
