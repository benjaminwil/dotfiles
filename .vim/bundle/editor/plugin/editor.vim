" editor.vim - for high-class writers of markdown

augroup MarkdownFiletype
  " this plugin should only be used with the markdown filetype.
  au!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd Filetype markdown call SetMarkdownOptions()
  autocmd Filetype markdown call RichMarkdownPunctuation()
  inoremap <tab> <c-r>=TabComplete()<CR>
augroup end

function SetMarkdownOptions()
  " get the system language and grabs the code that vim needs for the
  " spelllang setting. (e.g. "en_us".)
  let s:language_setting = matchstr(system('echo $LANG'), '\a\{2}_\a\{2}')

  " if the system language is retrievable, turn on spell and set the
  " spelllang to the current language. otherwise use american english.
  if exists(s:language_setting)
    setlocal spell spelllang=language
    setlocal spellfile=~/.vim/spell/custom.utf-8.add
  else
    setlocal spell spelllang=en_us
    setlocal spellfile=~/.vim/spell/custom.utf-8.add
  endif

  " set the textwidth for the markdown file
  setlocal textwidth=80
endfunction

function RichMarkdownPunctuation()
  " set the hyphen character `-` as a keyword. this lets us create en-dashes
  " as well as em-dashes while only using repeated hyphens.
  setlocal iskeyword+=-

  " create an abbreviation for en-dashes.
  iabbrev <buffer> --- –

  " create an abbreviation for em-dashes.
  iabbrev <buffer> ---- —

  " create abbreviations for guillemets.
  iabbrev <buffer> << «
  iabbrev <buffer> >> »
endfunction

function FormatMarkdownTable()
  " TODOs
endfunction

function! TabComplete()
  " gets the currently selected line
  let line = getline('.')

  " gets the first part of the line -- from the start to one character after
  " the cursor position.
  let substr = strpart(line, -1, col('.')+1)

  " gets the current word until the cursor position. it matches nothing on an
  " empty string, and it is smart about punctuation.
  let substr = matchstr(substr, "[^ \t]*$")

  if (strlen(substr)==0)
    return "\<tab>"
  endif

  let has_period = match(substr, '\.') != -1
  let has_slash = match(substr, '\/') != -1

  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"
  elseif ( has_slash )
    return "\<C-X>\<C-F>"
  else
    return "\<C-X>\<C-O>"
  endif
endfunction
