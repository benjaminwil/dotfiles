runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

color jellybeans

filetype plugin on
filetype plugin indent on

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.js.liquid set filetype=javascript

set wildignore=*.swp,*.DS_Store,.git/

set backspace=2
set cursorline
set display+=lastline
set expandtab
set fillchars+=vert:│
set linebreak
set linespace=5
set nofoldenable
set noru
set number
set nosmd
set paste
set shiftwidth=2
set tabstop=2
set wrap

let g:goyo_width=140

set laststatus=2
set statusline=
set statusline+=%#ColorColumn#  
set statusline+=\ 0%n
set statusline+=\ %y
set statusline+=\ %t
set statusline+=\ %{fugitive#statusline()}
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

nnoremap <C-I> i <ESC>r

