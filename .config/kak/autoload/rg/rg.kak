define-command rg \
    -params .. \
    -file-completion \
    -docstring %{
        rg [<arguments>]: ripgrep utility wrapper.
        All optional arguments are forwarded to ripgrep.
    } \
    %{ evaluate-commands %sh{
         if [ $# -eq 0 ]; then
             set -- "${kak_selection}"
         fi

         rgfmt_path="$HOME/.config/kak/autoload/rg/rgfmt"
         output=$(mktemp -d "${TMPDIR:-/tmp}"/kak-rg.XXXXXXXX)/fifo

         mkfifo ${output}

         ( rg "$@" \
             --glob '!{.git,node_modules}' \
             --hidden \
             --ignore-case \
             --json | \
             "$rgfmt_path" > ${output} 2>&1 & ) > /dev/null 2>&1 < /dev/null
     printf %s\\n "evaluate-commands -try-client '$kak_opt_toolsclient' %{
               edit! -fifo ${output} *rg*
               set-option buffer filetype grep
               set-option buffer grep_current_line 0
               hook -always -once buffer BufCloseFifo .* %{ nop %sh{ rm -r $(dirname ${output}) } }
           }"
}}
