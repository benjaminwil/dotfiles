set display+=lastline
set laststatus=2

set statusline =\ \ %n
set statusline+=\ %3{FileType()}
set statusline+=\ \ %5f
set statusline+=\ %r%=\ %{Modified()}
set statusline+=\ %3c\•%1{LineLength()}
set statusline+=\ \ |

function! FileType()
  " returns the current file's filetype, but without square brackets like %y
  return &ft
endfunction

function! LineLength()
  return strwidth(getline("."))
endfunction

function! Modified()
  if &modified
    return "+"
  else
    return ""
  endif
endfunction

