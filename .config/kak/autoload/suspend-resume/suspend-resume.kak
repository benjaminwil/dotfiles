def suspend-and-resume \
    -params 1..2 \
    -docstring 'suspend-and-resume <cli command> [<kak command after resume>]: backgrounds the current Kakoune client and runs specified cli command. Upon exit of command the optional kak command is executed.' \
    %{ evaluate-commands %sh{
        cli_cmd="$1 && fg"

        post_resume_cmd="$2"

        platform=$(uname -s)

        case $platform in
            Darwin)
                automate_cmd="sleep 0.01; osascript -e 'tell application \"System Events\" to keystroke \"$cli_cmd\" & return '"
                kill_cmd="/bin/kill"

                break
                ;;
            Linux)
                automate_cmd="sleep 0.2; xdotool type '$cli_cmd'; xdotool key Return"
                kill_cmd="/usr/bin/kill"

                break
                ;;
        esac

        # Use the platform-specific automation command to schedule the sending of
        # our command.
        nohup sh -c "$automate_cmd"  > /dev/null 2>&1 &
        $kill_cmd -SIGTSTP $kak_client_pid

        if [ ! -z "$post_resume_cmd" ]; then
            echo "$post_resume_cmd"
        fi
    }}
