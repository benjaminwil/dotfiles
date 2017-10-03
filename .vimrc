runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

color zenburn

nnoremap <silent> <Leader>l
\ :if exists('w:long_line_match') <Bar>
\   silent! call matchdelete(w:long_line_match) <Bar>
\   unlet w:long_line_match <Bar>
\ elseif &textwidth > 0 <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
\ else <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
\ endif<CR>

nnoremap <Leader>w :let _save_pos=getpos(".") <Bar>
\ :let _s=@/ <Bar>
\ :%s/\s\+$//e <Bar>
\ :let @/=_s <Bar>
\ :nohl <Bar>
\ :unlet _s<Bar>
\ :call setpos('.', _save_pos)<Bar>
\ :unlet _save_pos<CR><CR>

filetype plugin on
filetype plugin indent on

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.js.liquid set filetype=javascript

set wildignore=*.swp,*.DS_Store,.git/

set backspace=2
set cursorline
set display+=lastline
set tabstop=2
set expandtab
set fillchars+=vert:│
set linebreak
set linespace=5
set nofoldenable
set noru
set nosmd
set number
set shiftwidth=2
set wrap

let g:goyo_width=90

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

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]

