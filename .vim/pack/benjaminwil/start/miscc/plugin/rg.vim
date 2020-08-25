function! RgProjectSearch()
  call inputsave()
  let regex = input('Search project for: ')
  call inputrestore()

  if regex == ''
    redraw!
    return
  endif

  let rg_options = "--max-columns 60 --max-columns-preview --vimgrep"
  let results = split(system("rg " . rg_options . " '" . regex . "' *"), '\n')
  let entries = map(results, function('s:ParseRgEntries'))

  call setqflist([], 'r', { 'title': 'Project Results',
                          \ 'items': entries,
                          \ 'quickfixtextfunc': 'QuickFixDisplay' })
  execute ":cwindow"
endfunction

function! s:ParseRgEntries(index, value)
  let result = split(a:value, ':')

  let filename = result[0]
  let lnum = result[1]
  let col = result[2]
  let text = join(result[3:-1], ':')

  return { 'filename': filename,
         \ 'lnum': lnum,
         \ 'col': col,
         \ 'type': 'n',
         \ 'text': text }
endfunction
