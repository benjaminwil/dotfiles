" aesthetics
colorscheme anise
set background=dark
set cursorline
set display+=lastline
set number
set wrap

" clipboard
if has('Darwin')
  set clipboard+=unnamed,unnamedplus
else
  set clipboard=unnamed
endif

" files
filetype plugin on
filetype plugin indent on
set backupdir=~/.vim/temp
set hidden
set wildignore=*.swp,*.DS_Store,.git/,.tags

" leader
let mapleader="\<space>"

" syntax
set hlsearch
syntax on

" tabs
set expandtab
set softtabstop=0
set tabstop=2
set shiftwidth=2
