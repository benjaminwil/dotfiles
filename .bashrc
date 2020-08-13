[[ $- != *i* ]] && return

# aliases
alias dotfiles="command git    \
    --git-dir=$HOME/.dotfiles/ \
    --work-tree=$HOME"
alias ls="ls -Glh"
alias hist="rg . ~/.bash_history | fzy -l 5 | xargs -d '\n' bash -ic"

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

# bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\C-r": "hist \C-j"'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# prompt
source ~/.config/bash/prompt.sh

