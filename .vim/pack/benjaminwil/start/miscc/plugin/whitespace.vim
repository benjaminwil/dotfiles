function <SID>RemoveTrailingWhiteSpace()
    let line = line(".")
    let column = col(".")
    keepp %s/\s\+$//e
    call cursor(line, column)
endfunction

autocmd BufWritePre * :call <SID>RemoveTrailingWhiteSpace()
