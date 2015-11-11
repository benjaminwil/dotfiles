" pathogen
execute pathogen#infect()

" colourscheme
colorscheme zenburn

" filetypes
filetype plugin on
filetype plugin indent on
au BufRead,BufNewFile *.fountain set filetype=fountain
au BufRead,BufNewFile *.md set filetype=markdown

" general
set cursorline
set display+=lastline
set expandtab
set linebreak
set linespace=5
set nofoldenable
set nonumber
set noru
set nosmd
set tabstop=3
set wrap
filetype indent off

" markdown to html
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

" plugins
let g:goyo_width=140

" splits
set fillchars+=vert:│ 

" statusline
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

" syntax
iabbrev <// </<C-X><C-O>
set omnifunc=syntaxcomplete#Complete
set spell spelllang=en_ca
syntax on
