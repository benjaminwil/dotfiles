function! QuickFixDisplay(info) abort
  if a:info.quickfix
    let results_list = getqflist(#{id: a:info.id, items: 0}).items
  else
    let results_list = getloclist(a:info.winid, #{id: a:info.id, items: 0}).items
  endif

  let rows = []

  let lnum_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
    \ ->map({_, v -> results_list[v].lnum})
    \ ->max()
    \ ->len()

  let col_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
    \ ->map({_, v -> results_list[v].col})
    \ ->max()
    \ ->len()

  let fname_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
    \ ->map({_, v -> results_list[v].bufnr->bufname()->fnamemodify(':t')->strchars(1)})
    \ ->max()

  let type_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
    \ ->map({_, v -> get(s:EFM_TYPE, results_list[v].type, '')->strlen()})
    \ ->max()

  let errnum_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
    \ ->map({_, v -> results_list[v].nr})
    \ ->max()
    \ ->len()

  for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
    let row = results_list[idx]

    if !row.valid
      call add(rows, '|| ' .. row.text)
    else
      if row.lnum == 0 && row.col == 0
        call add(rows, bufname(row.bufnr))
      else
        let fname = printf('%-*S', fname_width, bufname(row.bufnr)->fnamemodify(':t'))
        let lnum = printf('%*d', lnum_width, row.lnum)
        let col = printf('%*d', col_width, row.col)
        let type = printf('%-*S', type_width, get(s:EFM_TYPE, row.type, ''))
        let errnum = ''

        if row.nr
          let errnum = printf('%*d', errnum_width + 1, row.nr)
        endif

        call add(rows, printf('%s|%s col %s %s%s| %s', fname, lnum, col, type, errnum, row.text))
      endif
    endif
  endfor

  return rows
endfunction

const s:EFM_TYPE = #{e: 'error', w: 'warning', i: 'info', n: 'note'}
