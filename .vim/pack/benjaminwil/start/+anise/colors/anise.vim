if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "anise"

set t_Co=16 " sets the terminal to use 16 colors

if &background ==# 'dark'
  hi Boolean      cterm=none ctermbg=none ctermfg=2
  hi Comment      cterm=none ctermbg=none ctermfg=8
  hi Conditional  cterm=none ctermbg=none ctermfg=6
  hi Constant     cterm=none ctermbg=none ctermfg=15
  hi CursorLine   cterm=none ctermbg=none ctermfg=none
  hi CursorLineNr cterm=none ctermbg=none ctermfg=1
  hi Define       cterm=none ctermbg=none ctermfg=7
  hi Delimiter    cterm=none ctermbg=none ctermfg=15
  hi DiffAdd      cterm=none ctermbg=none ctermfg=2
  hi DiffChange   cterm=none ctermbg=none ctermfg=6
  hi DiffDelete   cterm=none ctermbg=none ctermfg=1
  hi DiffText     cterm=none ctermbg=6 ctermfg=1
  hi EndOfBuffer  cterm=none ctermbg=none ctermfg=8
  hi Folded       cterm=none ctermbg=none ctermfg=4
  hi Identifier   cterm=none ctermbg=none ctermfg=12
  hi LineNr       cterm=none ctermbg=0 ctermfg=3
  hi MatchParen   cterm=none ctermbg=3 ctermfg=0
  hi NonText      cterm=none ctermbg=none ctermfg=3
  hi Number       cterm=none ctermbg=none ctermfg=5
  hi PreProc      cterm=none ctermbg=none ctermfg=7
  hi Search       cterm=none ctermbg=3 ctermfg=0
  hi Special      cterm=none ctermbg=none ctermfg=1
  hi SpellCap     cterm=none ctermbg=none ctermfg=3
  hi SpellLocal   cterm=none ctermbg=none ctermfg=none
  hi SpellBad     cterm=none ctermbg=none ctermfg=1
  hi Statement    cterm=none ctermbg=none ctermfg=4
  hi String       cterm=none ctermbg=none ctermfg=15
  hi Title        cterm=bold ctermbg=none ctermfg=1
  hi Type         cterm=none ctermbg=none ctermfg=15
  hi Underlined   cterm=underline ctermbg=none ctermfg=1
  hi VertSplit    cterm=none ctermbg=none ctermfg=8
  hi Visual       cterm=none ctermbg=15 ctermfg=0
endif

