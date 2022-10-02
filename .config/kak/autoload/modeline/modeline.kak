declare-option -hidden str cursor_line_length
declare-option -hidden str truncated_bufname

define-command get-cursor-line-length -hidden \
%{
    set-option buffer cursor_line_length %sh{
        [ -f $kak_buffile ] && \
            awk -v c=$kak_cursor_line "{if(NR==c) print length}" "$kak_buffile"
    }
}

define-command truncate-bufname -hidden \
%{
    set-option buffer truncated_bufname %sh{
        printf "%s\n" "${kak_bufname}" | \
            perl -pe \
                's:(?(?<=/)|(?<=^))([^\p{Letter}\p{Digit}]+.|[^/]).+?/:\1/:g'
    }
}

hook global BufWritePost .* truncate-bufname
hook global RawKey .*       get-cursor-line-length
hook global WinDisplay .*   truncate-bufname

set-option global modelinefmt ''
set-option -add global modelinefmt \
    ' %val{cursor_char_column}'
set-option -add global modelinefmt \
    '•'
set-option -add global modelinefmt \
    '%opt{cursor_line_length} '
set-option -add global modelinefmt \
    '╷ {{mode_info}} '
set-option -add global modelinefmt \
    '╷ %opt{truncated_bufname} '
set-option -add global modelinefmt \
    '╷ %opt{filetype} '
