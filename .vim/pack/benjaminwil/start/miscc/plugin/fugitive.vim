if !empty(glob("~/.vim/pack/plugins/start/fugitive/plugin/fugitive.vim"))
  set display+=lastline
  set laststatus=2

  set statusline =\ \ %n
  set statusline+=\ %{CustomPathDisplay()}
  set statusline+=\ %{fugitive#statusline()}
  set statusline+=\ %r%=\ %m
  set statusline+=\ %c\•%{LineLength()}
  set statusline+=\ %{FileType()}
  set statusline+=\ %l\/%L
  set statusline+=\ \ |
endif

function! FileType()
  " returns the current file's filetype, but without square brackets like %y
  return &ft
endfunction

function LineLength()
  return strwidth(getline("."))
endfunction

function CustomPathDisplay()
  let l:path = expand("%")
  let l:dirList = split(l:path, "/")
  let l:dirCount = len(l:dirList)

  if l:dirCount >= 3
    let l:firstDirToDisplay = l:dirCount - 3
    let l:subsetPath = l:dirList[l:firstDirToDisplay:-1]
    let l:printPath = ["…"] + l:subsetPath

    let l:path = join(l:printPath, "/")
  endif

  return l:path
endfunction
