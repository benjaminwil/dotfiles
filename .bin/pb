#! /bin/sh
# A copy and paste command for X11, Wayland, Termux, and macOS.
# https://github.com/dbohdan/pb
# License: MIT
set -eu

cmd=$(basename "$0")
action=''
# Program version.
version='0.2.0'

usage() {
    me=$cmd
    if [ "$me" != pbcopy ] && [ "$me" != pbpaste ]; then
        me="$me (copy|paste)"
    fi

    cat <<EOF
Usage: $me [-h] [-V] [-p <pasteboard>]

  -h, --help
          Print this help and exit

  -V, --version
          Print version and exit

  -p, -pboard, --pboard <pasteboard>
          Specify the pasteboard:
            - macOS: 'general', 'ruler', etc.
            - Termux: 'clipboard'
            - Wayland: 'clipboard', 'primary'
            - X11: 'clipboard', 'primary', 'secondary'
EOF
}

# Default pasteboard.
if [ "$(uname)" = Darwin ]; then
    pboard=general
else
    pboard=clipboard
fi

# Parse the priority command-line options for help and version.
handle_help_and_version() {
    while [ $# -gt 0 ]; do
        case "$1" in
        -h | --help)
            usage
            exit 0
            ;;

        -V | --version)
            echo "pb version $version"
            exit 0
            ;;
        esac

        shift
    done
}

handle_help_and_version "$@"

# Determine if we're copying or pasting.
if [ "$cmd" = pbcopy ]; then
    action='copy'
elif [ "$cmd" = pbpaste ]; then
    action='paste'
elif [ "${1:-}" = copy ] || [ "${1:-}" = paste ]; then
    action=$1
    shift
else
    echo "Start the program as 'pbcopy' or 'pbpaste' or specify the action 'copy' or 'paste' as the first argument"
    exit 2
fi

# Parse regular command-line options.
while [ $# -gt 0 ]; do
    case "$1" in
    -p | -pboard | --pboard)
        flag=$1
        shift
        if [ $# -eq 0 ]; then
            echo "$cmd: missing argument for '$flag'" >&2
            exit 2
        fi

        pboard=$1
        shift
        ;;

    -*)
        echo "$cmd: unknown option: $1" >&2
        exit 2
        ;;

    *)
        echo "$cmd: unknown argument: $1" >&2
        exit 2
        ;;
    esac
done

pboard_lc=$(printf "%s" "$pboard" | tr '[:upper:]' '[:lower]:')

# Select and run the clipboard command.
if [ "$(uname)" = Darwin ] && [ -x /usr/bin/pbcopy ] && [ -x /usr/bin/pbpaste ]; then
    # macOS
    if [ "$action" = copy ]; then
        exec /usr/bin/pbcopy -pboard "$pboard"
    else
        exec /usr/bin/pbpaste -pboard "$pboard"
    fi

elif [ -n "${TERMUX_VERSION:-}" ] && command -v termux-clipboard-get >/dev/null 2>&1 && command -v termux-clipboard-set >/dev/null 2>&1; then
    # Termux (Android)
    if [ "$pboard_lc" != "clipboard" ]; then
        echo "$cmd: invalid pasteboard '$pboard' for Termux (only 'clipboard' is supported)" >&2
        exit 2
    fi

    if [ "$action" = copy ]; then
        exec termux-clipboard-set
    else
        exec termux-clipboard-get
    fi

elif [ -n "${WAYLAND_DISPLAY:-}" ] && command -v wl-copy >/dev/null 2>&1 && command -v wl-paste >/dev/null 2>&1; then
    # Wayland
    case "$pboard_lc" in
    clipboard)
        wl_flag=''
        ;;

    primary)
        wl_flag='--primary'
        ;;

    *)
        echo "$cmd: invalid pasteboard '$pboard' for Wayland ('clipboard' and 'primary' are supported)" >&2
        exit 2
        ;;
    esac

    if [ "$action" = copy ]; then
        exec wl-copy $wl_flag
    else
        exec wl-paste $wl_flag
    fi

elif [ -n "${DISPLAY:-}" ] && command -v xsel >/dev/null 2>&1; then
    # X11

    case "$pboard_lc" in
    clipboard)
        xsel_flag='--clipboard'
        ;;

    primary)
        xsel_flag='--primary'
        ;;

    secondary)
        xsel_flag='--secondary'
        ;;

    *)
        echo "$cmd: invalid pasteboard '$pboard' for X11 ('clipboard', 'primary', and 'secondary' are supported)" >&2
        exit 2
        ;;
    esac

    if [ "$action" = copy ]; then
        exec xsel "$xsel_flag" --input
    else
        exec xsel "$xsel_flag" --output
    fi

else
    echo "$cmd: no supported clipboard utilities found (pbcopy/pbpaste, termux-clipboard-get/termux-clipboard-set, wl-copy/wl-paste, or xsel)" >&2
    exit 1
fi
