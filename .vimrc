" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" aesthetics
set cursorline
set display+=lastline
set number
set tabstop=2
set textwidth=80
set wrap

" files
au BufRead,BufNewFile *.md set filetype=markdown
filetype plugin on
filetype plugin indent on
set wildignore=*.swp,*.DS_Store,.git/

" status
set display+=lastline
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

" syntax
set omnifunc=syntaxcomplete#Complete
set spell spelllang=en_ca
syntax on


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
