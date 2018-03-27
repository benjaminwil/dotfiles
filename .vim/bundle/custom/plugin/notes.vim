" notes and todo formatting (depends on vim-markdown)
if @% =~# 'NOTES' || @% =~# 'TODO'
  let g:markdown_folding=1
endif

