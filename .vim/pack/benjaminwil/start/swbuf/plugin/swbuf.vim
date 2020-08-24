function! OpenBufferSwitcher()
  let buffers = split(execute(":buffers"), "\n")
  let entries = map(buffers, function('s:ParseBufferListEntry'))

  call setloclist(0, [], 'r', { 'title': 'Open Buffers', 'items': entries })
  execute ":lopen"

  " style the location-list split in an opinionated way
  setlocal nonumber conceallevel=2 concealcursor=nc
  execute ":hi QuickFixLine ctermfg=NONE cterm=bold guifg=NONE gui=bold"
  execute ":syntax match qfSeparator /\|/ transparent conceal"
endfunction

function! s:GetBufferNumber(entry)
  let regex = '^\s*[0-9+]'
  let number = matchstr(a:entry, regex)
  return str2nr(substitute(number, '  ', '', ''))
endfunction

function! s:ParseBufferListEntry(index, entry)
  let ignored_buffers_regex = '\s\s[a\-]'
  if a:entry =~ ignored_buffers_regex
    return
  endif

  let buffer_number = s:GetBufferNumber(a:entry)
  let buffer_name = bufname(buffer_number)
  if buffer_name == ''
    return
  endif

  return { 'bufnr': buffer_number, 'filename': buffer_name }
endfunction

