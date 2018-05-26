" aesthetics
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

" ctags
set tags=.tags;
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" files
filetype plugin on
filetype plugin indent on
set hidden
set wildignore=*.swp,*.DS_Store,.git/,.tags

" fzf
set rtp+=/usr/local/opt/fzf

" leader
let mapleader="\<space>"

" netrw
autocmd FileType netrw setl bufhidden=wipe
let g:netrw_banner=0
let g:netrw_list_hide='^\.,.*\.swp$,.DS_Store,.tags,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
map - :Explore<CR>

" status
set display+=lastline
set laststatus=2
""" set statusline=\ %n\ %y\ %t\ %{fugitive#statusline()}\ %r%=\ %m\ %p%%\ (%c)\ %l/%L\ \

" syntax
set hlsearch
set omnifunc=syntaxcomplete#Complete
set spellfile=~/.vim/spell/custom.utf-8.add
syntax on

" tabs
set expandtab
set softtabstop=0
set tabstop=2
set shiftwidth=2
