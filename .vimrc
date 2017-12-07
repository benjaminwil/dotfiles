" pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" aesthetics
color zenburn
set cursorline
set display+=lastline
set number
set wrap

" files
filetype plugin on
filetype plugin indent on
set wildignore=*.swp,*.DS_Store,.git/

" markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md,*.markdown setlocal textwidth=80
au BufRead,BufNewFile *.md,*.markdown setlocal spell spelllang=en_ca

" netrw
let g:netrw_banner=0
map - :Explore<CR>
let g:netrw_list_hide='^\.,.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'

" status
set display+=lastline
set laststatus=2
set statusline=%#ColorColumn#0%n\ %y\ %t\ %{fugitive#statusline()}\ %r%=\ %m\ %p%%\ (%c)\ %l/%L

" syntax
set omnifunc=syntaxcomplete#Complete
syntax on

" tabs
set expandtab
set softtabstop=0
set tabstop=2
set shiftwidth=2
