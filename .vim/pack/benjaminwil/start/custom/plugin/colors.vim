set t_Co=16 " sets the terminal to use 16 colors

if &background ==# 'dark'
  hi Boolean      cterm=none       ctermbg=none  ctermfg=3
  hi Comment      cterm=none       ctermbg=none  ctermfg=6
  hi Constant     cterm=none       ctermbg=none  ctermfg=4
  hi CursorLine   cterm=none       ctermbg=0     ctermfg=none
  hi CursorLineNr cterm=none       ctermbg=none  ctermfg=1
  hi Delimiter    cterm=none       ctermbg=none  ctermfg=15
  hi DiffAdd      cterm=none       ctermbg=none  ctermfg=2
  hi DiffChange   cterm=none       ctermbg=none  ctermfg=6
  hi DiffDelete   cterm=none       ctermbg=none  ctermfg=1
  hi DiffText     cterm=none       ctermbg=6     ctermfg=15
  hi EndOfBuffer  cterm=none       ctermbg=none  ctermfg=8
  hi Folded       cterm=none       ctermbg=none  ctermfg=4
  hi Identifier   cterm=none       ctermbg=none  ctermfg=15
  hi LineNr       cterm=none       ctermbg=0     ctermfg=3
  hi MatchParen   cterm=none       ctermbg=3     ctermfg=0
  hi NonText      cterm=none       ctermbg=none  ctermfg=3
  hi Number       cterm=none       ctermbg=none  ctermfg=4
  hi PreProc      cterm=none       ctermbg=none  ctermfg=1
  hi Search       cterm=none       ctermbg=3     ctermfg=15
  hi Special      cterm=none       ctermbg=none  ctermfg=15 
  hi SpellCap     cterm=none       ctermbg=none  ctermfg=3
  hi SpellLocal   cterm=none       ctermbg=none  ctermfg=none
  hi SpellBad     cterm=none       ctermbg=none  ctermfg=1
  hi Statement    cterm=none       ctermbg=none  ctermfg=4 
  hi String       cterm=none       ctermbg=none  ctermfg=15
  hi Title        cterm=bold       ctermbg=none  ctermfg=1
  hi Type         cterm=none       ctermbg=none  ctermfg=15
  hi Underlined   cterm=underline  ctermbg=none  ctermfg=15
  hi VertSplit    cterm=none       ctermbg=none  ctermfg=8
  hi Visual       cterm=none       ctermbg=15    ctermfg=0
endif

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
