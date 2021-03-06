function! OpenBufferSwitcher()
  let buffers = split(execute(":buffers"), "\n")
  let entries = map(buffers, function('s:ParseBufferListEntry'))

  call setloclist(0, [], 'r', { 'title': 'Open Buffers',
                              \ 'items': entries,
                              \ 'quickfixtextfunc': 's:SwitcherDisplay' })
  execute ":lopen"
  setlocal nonumber

  " always close the buffer switcher when leaving it
  au! BufLeave <buffer> bdelete
endfunction

function! s:GetBufferNumber(entry)
  let regex = '^\s*\d*'
  let number = matchstr(a:entry, regex)
  return str2nr(substitute(number, '  ', '', ''))
endfunction

function! s:ParseBufferListEntry(index, entry)

  let buffer_number = s:GetBufferNumber(a:entry)
  let buffer_name = bufname(buffer_number)
  if buffer_name == ''
    let buffer_name = 'no name'
  endif

  return { 'bufnr': buffer_number,
         \ 'filename': buffer_name,
         \ 'type': 'n',
         \ 'lnum': 1,
         \ 'col': 1 }
endfunction

function! s:SwitcherDisplay(info) abort
  let rows = []
  let results_list = getloclist(a:info.winid, #{id: a:info.id, items: 0}).items

  let bufnr_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
                    \ ->map({_, v -> results_list[v].bufnr})
                    \ ->max()
                    \ ->len()

  for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
    let row = results_list[idx]
    let bufnr = printf('%*d', bufnr_width, row.bufnr)
    let fname = bufname(row.bufnr)

    call add(rows, printf('  %s %s', bufnr, fname))
  endfor

  return rows
endfunction
