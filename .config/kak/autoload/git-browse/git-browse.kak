define-command git-browse \
    -docstring "Opens a browser to the current file (on the current)
    branch on the `origin` remote. Only if it uses a compatible git forge." \
    %{ evaluate-commands %sh{
    		remote_address="$(git remote get-url origin)"
        case $remote_address in
            git@github.com*)
                branch="$(git rev-parse --abbrev-ref HEAD)"
                path=${remote_address#*:}
                url="https://github.com/${path}/blob/${branch}/${kak_bufname}"

                open "${url}"
                ;;
            *)
                printf "echo '%s'" ${remote_address}
                ;;
    		esac
		}}
