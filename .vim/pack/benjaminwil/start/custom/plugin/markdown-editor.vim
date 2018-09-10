" editor.vim - for high-class writers of markdown

augroup MarkdownFiletype
  " this plugin should only be used with the markdown filetype.
  au!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd Filetype markdown call SetMarkdownOptions()
  autocmd Filetype markdown call RichMarkdownPunctuation()
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

function FormatMarkdownTable()
  " TODOs
endfunction

