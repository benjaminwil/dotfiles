" editor.vim - for high-class writers of markdown

augroup MarkdownFiletype
  " this plugin should only be used with the markdown filetype
  au!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd Filetype markdown call SetMarkdownOptions()
augroup end

function SetMarkdownOptions()
  " get the system language and grabs the code that vim needs for the
  " spelllang setting. (e.g. "en_us".)
  let g:language_setting = matchstr(system('echo $LANG'), '\a\{2}_\a\{2}')
  
  " if the system language is retrievable, turn on spell and set the
  " spelllang to the current language. otherwise use american english.
  if exists(g:language_setting)
    setlocal spell spelllang=language
  else
    setlocal spell spelllang=en_us
  endif
  
  " set the textwidth for the markdown file
  setlocal textwidth=80
endfunction

function FormatMarkdownTable()

  " TODO
endfunction
