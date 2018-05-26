if !empty(glob("~/.vim/pack/benjaminwil/start/fugitive/plugin/fugitive.vim"))
  set display+=lastline
  set laststatus=2
  set statusline=\ %n\ %y\ %t\ %{fugitive#statusline()}\ %r%=\ %m\ %p%%\ (%c)\ %l/%L\ \
endif
