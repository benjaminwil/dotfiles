function! RgFzyFileSearch(vim_command)
  try
   let rg_command = "rg --files"
   let output = system(rg_command . " | fzy --lines=20 ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

if has('nvim')
  function! RgFzyFileSearch(vim_command) abort
    let l:rg_command = "rg --files"
    let l:callback = {
      \ 'window_id': win_getid(),
      \ 'filename': tempname(),
      \ 'vim_command': a:vim_command
    \ }

    function! l:callback.on_exit(job_id, data, event) abort
      bdelete!
      call win_gotoid(self.window_id)
      if filereadable(self.filename)
        try
  	let l:selected_filename = readfile(self.filename)[0]
  	exec self.vim_command . ' ' . l:selected_filename
  	catch /E684/
        endtry
      endif
      call delete(self.filename)
    endfunction

    botright 10 new
    let l:terminal_command = l:rg_command . ' | fzy > ' .  l:callback.filename
    silent call termopen(l:terminal_command, l:callback)
    setlocal nonumber norelativenumber
    startinsert
  endfunction
endif
