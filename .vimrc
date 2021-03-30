" aesthetics
colorscheme anise
set background=dark
set cursorline
set display+=lastline
set encoding=utf-8
set fillchars+=vert:\¦
set number
set scrolloff=12
set wrap

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
set directory=$HOME/.vim/swap//

" tabs
set expandtab
set softtabstop=0
set tabstop=2
set shiftwidth=2

" project-specific vim configuration
set exrc
set secure

set updatetime=100
