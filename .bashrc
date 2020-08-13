[[ $- != *i* ]] && return

# aliases
alias dotfiles="command git    \
    --git-dir=$HOME/.dotfiles/ \
    --work-tree=$HOME"
alias ls="ls -Glh"
alias hist="rg . ~/.bash_history | fzy -l 5 | xargs -d '\n' bash -ic"

# asdf
source ~/.asdf/asdf.sh

# colours
export TERM=screen-256color

# history
HISTCONTROL=erasedups:ignoreboth
HISTFILESIZE=-1
HISTSIZE=-1

export HISTIGNORE="&:[  ]*:exit:ls:bg:fg:history:clear"
export PROMPT_COMMAND="history -a"

shopt -s histappend
shopt -s cmdhist

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
bind '"\C-r": "hist \C-j"'

# private
if [ -e ~/.config/bash/private.sh ]; then
    source ~/.config/bash/private.sh
else
    echo "~/.bashrc: Initializing ~/.config/bash/private.sh 👌" && \
      touch ~/.config/bash/private.sh
fi

# prompt
source ~/.config/bash/prompt.sh

# nix package manager
if [ -e ~/.nix-profile ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

