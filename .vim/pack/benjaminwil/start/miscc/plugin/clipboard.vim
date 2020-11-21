function! SetSystemClipboard()
  if !has("clipboard")
    echo "Note: This version of Vim doesn't have system clipboard access"
    return
  endif

  if has('Darwin')
    set clipboard+=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endfunction

call SetSystemClipboard()
