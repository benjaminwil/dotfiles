function! RSpecOnExitStatus(job, status)
  if a:status == 0
    let terminal_buffers = term_list()

    if len(terminal_buffers) == 1
      execute "bd " . terminal_buffers[0]
    endif
  endif

  echo "Terminal process completed."
endfunction

function! RSpecRunForCurrentFile(...)
  if !has("terminal")
    echo "Your version of Vim doesn't have +terminal."
    return
  end

  let line_number = get(a:, 0, 0)

  try
    throw (expand('%') =~ '_spec.rb')
  catch /0/
    echo "This command isn't valid. Is this an RSpec spec file?"
  catch /1/
    let rspec_command = "bundle exec rspec " . expand("%")
    let options = { "term_name": "rspec " . expand("%:t"),
                  \ "term_rows": 20,
                  \ "exit_cb": "RSpecOnExitStatus" }

    if line_number
      let rspec_command = rspec_command . ":" . line(".")
    endif

    call term_start(rspec_command, options)

    let g:rspec_runner_buffer_number = bufnr()

    wincmd p
  endtry
endfunction
