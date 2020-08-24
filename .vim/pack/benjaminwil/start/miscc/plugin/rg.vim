function! RgProjectSearch()
  call inputsave()
  let regex = input('Search project for: ')
  call inputrestore()

  if regex == ''
    redraw!
    return 0
  endif

  execute ":cexpr system('rg --vimgrep \"" . regex . "\" *') | cw"
endfunction
