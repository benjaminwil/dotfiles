function! RgProjectSearch()
  call inputsave()
  let regex = input('Search project for: ')
  call inputrestore()

  if regex == ''
    redraw!
    return
  endif

  let rg_command = "rg --ignore-case
                     \ --hidden
                     \ --follow
                     \ --max-columns-preview
                     \ --max-columns 40
                     \ --glob '!{.git,./node_modules,./tmp}'
                     \ --vimgrep"

  let results = split(system(rg_command . " '" . regex . "' *"), '\n')

  if len(results) == 0
    redraw!
    echo "No results for \"" . regex . "\""
    return
  endif

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
