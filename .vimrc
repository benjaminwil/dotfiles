runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

colorscheme zenburn

filetype plugin on
filetype plugin indent on
au BufRead,BufNewFile *.fountain set filetype=fountain
au BufRead,BufNewFile *.md set filetype=markdown
set wildignore=*.swp,*.DS_Store,.git/

set backspace=2
set cursorline
set display+=lastline
set expandtab
set linebreak
set linespace=5
set nofoldenable
set noru
set number
set nosmd
set shiftwidth=2
set tabstop=2
set wrap

let g:goyo_width=140

set fillchars+=vert:│ 

set laststatus=2
set statusline=
set statusline+=%#ColorColumn#  
set statusline+=\ 0%n
set statusline+=\ %y
set statusline+=\ %t
set statusline+=\ %r
set statusline+=%= 
set statusline+=\ %m
set statusline+=\ %p%%
set statusline+=\ (%c)
set statusline+=\ %l/%L
set statusline+=\  

iabbrev <// </<C-X><C-O>
set omnifunc=syntaxcomplete#Complete
set spell spelllang=en_ca
syntax on
