function! RgFzyFileSearch(vim_command)
  try
   let rg_command = "rg --files"   
   let output = system(rg_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>fe :call RgFzyFileSearch(':e')<cr>
nnoremap <leader>fv :call RgFzyFileSearch(':vs')<cr>
