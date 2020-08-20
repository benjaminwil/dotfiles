function! GrepToQuickFixWindow()
  try
    let regex = s:VisualSelection()
  catch
    call inputsave()
    let regex = input('Search project for: ')
    call inputrestore()
  endtry

  if regex == ''
    redraw!
    return 0
  endif

  execute ":cexpr system('rg --vimgrep \"" . regex . "\" *') | cw"
endfunction

" lifted from xolox and FocusedWolf on StackOverflow
" https://stackoverflow.com/posts/6271254/revisions
function! s:VisualSelection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)

  if len(lines) == 0
    return ''
  endif

  let lines[-1] = lines[-1][: column_end - (
    &selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]

  return join(lines, "\n")
endfunction
