[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/.local/bin:$HOME/.scripts:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar:/bin:$PATH
export WEECHAT_HOME=$HOME/.config/weechat/

export EDITOR='kak'
export VISUAL='kak'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# asdf version manager
[ -e $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh

# bundler (for ruby)
source $HOME/.config/bundler/global.sh

# macos only
[[ "$OSTYPE" == "darwin"* ]] && . $HOME/.config/macos/global.sh

# nix
if [ -n "$NIX_PROFILES" ]
then
    export NIX_SHELL_PRESERVE_PROMPT=1
fi

# private
if [ -e $HOME/.config/bash/private.sh ]
then
    . $HOME/.config/bash/private.sh
else
    echo "~/.bashrc: Initializing ~/.config/bash/private.sh 👌" && \
        touch $HOME/.config/bash/private.sh
fi

if command -v kak &> /dev/null
then
    PATH="$HOME/.config/kak/bin/:$PATH"
fi
