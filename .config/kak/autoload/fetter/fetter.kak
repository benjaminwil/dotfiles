define-command fetter \
    -params 1.. \
    -command-completion \
    -docstring 'Run a command as <command> sh -c {fetter} -- [arguments].' \
    %{
        %arg{1} sh -c %{
            export KAKOUNE_CLIENT=$1
            export KAKOUNE_CURRENT_BUFFER=$2
            export KAKOUNE_CURRENT_CURSOR_LINE=$3
            export KAKOUNE_CURRENT_WORKING_DIRECTORY=$4
            export KAKOUNE_SESSION=$5
            shift 6

            [ $# = 0 ] && set "$SHELL"

            "$@"
        } -- %val{client} %val{buffile} %val{cursor_line} %sh{pwd -P} %val{session} %arg{@}
    }
