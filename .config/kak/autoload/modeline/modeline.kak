set-option global modelinefmt ''

set-option -add global modelinefmt \
    ' %val{cursor_char_column}'
set-option -add global modelinefmt \
    '{bright-black,black}•{white,black}'
set-option -add global modelinefmt \
    '%sh{ [ -f $kak_buffile ] && awk -v c=$kak_cursor_line \
    "{if(NR==c) print length}" "$kak_buffile" } '
set-option -add global modelinefmt \
    '╷ {{mode_info}} '
set-option -add global modelinefmt \
    '╷ %val{bufname}'
set-option -add global modelinefmt \
    ' ✍ %opt{filetype} '
