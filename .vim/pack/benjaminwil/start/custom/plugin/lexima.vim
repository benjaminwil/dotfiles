if !empty(glob("~/.vim/pack/benjaminwil/start/lexima/plugin/lexima.vim"))
  call lexima#add_rule({'char': '**', 'input_after': '**', 'filetype': 'markdown'})
endif
