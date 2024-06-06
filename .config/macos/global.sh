[ -f /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)
[ -f /usr/local/bin/brew ] && eval $(/usr/local/bin/brew shellenv)

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]
then
 #   . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f /opt/homebrew/opt/openjdk@17/bin ]
then
    export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
fi

[ -z "${TERM##*xterm-kitty*}" ] && kitty @ set-window-title "Kitty"

[[ -f "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

if shopt -q progcomp && [ -r /opt/homebrew/Cellar/bash-completion/1.3_3/etc/bash_completion ]; then
    # Source completion code.
    . /opt/homebrew/Cellar/bash-completion/1.3_3/etc/bash_completion
fi

export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
