" encoding
set encoding=utf-8
scriptencoding utf-8

" aesthetics
set background=dark
set cursorline
set display+=lastline
set encoding=utf-8
set fillchars+=vert:\┊
set listchars=tab:»\ ,trail:▁,extends:…,precedes:…,nbsp:&,eol:¬
set nocursorline
set nowrap
set number
set scrolloff=12

" files
filetype plugin on
filetype plugin indent on
set hidden
set wildignore=*.swp,*.DS_Store,.git/,.tags

" leader
let mapleader="\<space>"

" syntax
set hlsearch
syntax on
set spellfile=~/.vim/spell/custom.utf-8.add

" tabs
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

" project-specific vim configuration
set exrc
set secure

" speedz
set updatetime=100

" system clipboard
function! SetSystemClipboard()
  if !has("clipboard")
    echo "Note: This version of Vim doesn't have system clipboard access"
    return
  endif

  if has('Darwin')
    set clipboard+=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endfunction
call SetSystemClipboard()

" clear trailing whitespace
function <SID>RemoveTrailingWhiteSpace()
    let line = line(".")
    let column = col(".")
    keepp %s/\s\+$//e
    call cursor(line, column)
endfunction
autocmd BufWritePre * :call <SID>RemoveTrailingWhiteSpace()
