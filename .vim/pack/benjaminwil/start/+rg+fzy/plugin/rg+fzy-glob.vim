function! RgFzyGlobSearch(vim_command)
  try
    let rg_command = "rg .
          \ --line-number
          \ --column
          \ --no-heading
          \ --fixed-strings
          \ --ignore-case
          \ --hidden
          \ --follow
          \ --glob '!{.git,node_modules}'"
    " Right now, this function requires rg to print path:line#:column# so awk can replace the output.
    let filename_and_location = system(rg_command . " | fzy | awk -F ':' '{print $1 \"\|\" $2 \"\|\" $3}' ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(filename_and_location)
    let output = split(filename_and_location, '|')
    execute a:vim_command . ' ' . output[0]
    call cursor(output[1], output[2])
  endif
endfunction

if has('nvim')
  function! RgFzyGlobSearch(vim_command) abort
    let l:rg_command = "rg .
     \ --line-number
          \ --column
          \ --no-heading
          \ --fixed-strings
          \ --ignore-case
          \ --hidden
          \ --follow
          \ --glob '!{.git,node_modules}'"

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
  	let l:result = split(readfile(self.filename)[0], '|')
          let l:selected_filename = l:result[0]
          exec self.vim_command . ' ' . l:selected_filename
          catch /E684/
        endtry
      endif
      call delete(self.filename)
      call cursor(l:result[1], l:result[2])
    endfunction

    botright 10 new
    let l:terminal_command = l:rg_command . " | fzy | awk -F ':' '{print $1 \"\|\" $2 \"\|\" $3}' > " . l:callback.filename
    silent call termopen(l:terminal_command, l:callback)
    setlocal nonumber norelativenumber
    startinsert
  endfunction
endif

nnoremap <leader>re :call RgFzyGlobSearch(':e')<cr>
nnoremap <leader>rv :call RgFzyGlobSearch(':vs')<cr>
