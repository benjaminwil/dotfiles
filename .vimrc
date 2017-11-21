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
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md,*.markdown setlocal textwidth=80
filetype plugin on
filetype plugin indent on
set wildignore=*.swp,*.DS_Store,.git/

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
set spell spelllang=en_ca
syntax on

" tabs
set expandtab
set softtabstop=0
set tabstop=2
set shiftwidth=2
 
" replace common punctuation
iabbrev <buffer> --- –
iabbrev <buffer> ---- —
iabbrev <buffer> << «
iabbrev <buffer> >> »

" remap backspace to x in normal mode
nnoremap <BS> X

" highlight long lines with <Leader>l
nnoremap <silent> <Leader>l
\ :if exists('w:long_line_match') <Bar>
\   silent! call matchdelete(w:long_line_match) <Bar>
\   unlet w:long_line_match <Bar>
\ elseif &textwidth > 0 <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
\ else <Bar>
\   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
\ endif<CR>

" kill extra spaces with <Leader>w
nnoremap <Leader>w :let _save_pos=getpos(".") <Bar>
\ :let _s=@/ <Bar>
\ :%s/\s\+$//e <Bar>
\ :let @/=_s <Bar>
\ :nohl <Bar>
\ :unlet _s<Bar>
\ :call setpos('.', _save_pos)<Bar>
\ :unlet _save_pos<CR><CR>
