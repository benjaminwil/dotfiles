" notes and todo formatting (depends on vim-markdown)
if @% =~# 'NOTES' || @% =~# 'TODO'
  let g:markdown_folding=1
endif

nnoremap dt "=strftime("%FT%T%z")<CR>P
