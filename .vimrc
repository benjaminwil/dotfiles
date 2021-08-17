" aesthetics
colorscheme anise
set background=dark
set cursorline
set display+=lastline
set encoding=utf-8
set fillchars+=vert:\¦
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

" swap
set directory=$HOME/.vim/swap/

" tabs
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

" project-specific vim configuration
set exrc
set secure

set updatetime=100

autocmd BufNewFile,BufRead *.deface set syntax=eruby

autocmd CursorHold * update
