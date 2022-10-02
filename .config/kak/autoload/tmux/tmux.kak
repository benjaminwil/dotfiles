define-command bw-tmux-terminal-impl -hidden -params 2.. -docstring "
    This private command is used by `tmux-terminal-popup`. It is a direct
    port of `tmux-terminal-impl`, which is included in Kakoune's default
    `rc/windowing/tmux` scripts." \
%{
    evaluate-commands %sh{
        tmux=${kak_client_env_TMUX:-$TMUX}

        if [ -z "$tmux" ]
        then
            echo "fail 'This command is only available in a tmux session'"
            exit
        fi

        tmux_args="$1"

        if [ "${1%%-*}" = split ]
        then
            tmux_args="$tmux_args -t ${kak_client_env_TMUX_PANE}"
        fi

        shift

        if [ -n "$TMPDIR" ]
        then
            TMUX=$tmux tmux $tmux_args \
                env TMPDIR="$TMPDIR" \
                "$@" \
                < /dev/null > /dev/null 2>&1 &
        else
            TMUX=$tmux tmux $tmux_args "$@" < /dev/null > /dev/null 2>&1 &
        fi
    }
}

define-command bw-tmux-repl-impl -hidden -params 1.. -docstring "
    This private command is used by `tmux-repl-popup`. It is a direct port of
    `tmux-repl-impl`, which is included in Kakoune's default
    `rc/windowing/repl/tmux` scripts." \
%{
    evaluate-commands %sh{
        if [ -z "$TMUX" ]
        then
            echo 'fail This command is only available in a tmux session'
            exit
        fi

        tmux_args="$1"
        shift

        tmux $tmux_args "$@"
        printf "set-option current tmux_repl_id '%s'" \
            $(tmux display-message -p '#{session_id}:#{window_id}.#{pane_id}')
    }
}

define-command tmux-terminal-popup -params 1.. -shell-completion -docstring "
    tmux-terminal-popup <program> [<arguments>]: create a new terminal as a
    Tmux popup. The program passed as an argument will be executed in the new
    popup." \
%{
    bw-tmux-terminal-impl "display-popup -E -d %val{client_env_PWD}" %arg{@}
}

define-command tmux-repl-popup -params 1.. -shell-completion -docstring "
   tmux-repl-popup <program> [<arguments>]: create a new Tmux popup for REPL
   interaction. The program passed as an argument will be executed in the
   new popup." \
%{
    bw-tmux-repl-impl "display-popup -E -d %val{client_env_PWD}" %arg{@}
}
