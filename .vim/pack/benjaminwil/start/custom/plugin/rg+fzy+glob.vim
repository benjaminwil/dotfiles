function RgFzyGlobSearch(vim_command)
  try
    let rg_command = "rg .
          \ --line-number
          \ --column
          \ --no-heading
          \ --fixed-strings
          \ --ignore-case
          \ --hidden
          \ --follow
          \ --glob '!.git/*'"
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

nnoremap <leader>re :call RgFzyGlobSearch(':e')<cr>
nnoremap <leader>rv :call RgFzyGlobSearch(':vs')<cr>
