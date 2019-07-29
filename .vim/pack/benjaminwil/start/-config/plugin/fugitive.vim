if !empty(glob("~/.vim/pack/benjaminwil/start/fugitive/plugin/fugitive.vim"))
  set display+=lastline
  set laststatus=2
  set statusline=\ \ %n\ %t\ %{fugitive#statusline()}\ %r%=\ %m\ %{FT()}\ %c\•%l\•%L\ \
endif

function! FT()
  " returns the current file's filetype, but without square brackets like %y
  return &ft
endfunction
