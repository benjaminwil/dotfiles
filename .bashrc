[[ $- != *i* ]] && return

# aliases
alias bx="bundle exec"
alias dotfiles="command git --git-dir=$HOME/.dotfiles/ \
                            --work-tree=$HOME"
alias hist="rg . ~/.bash_history | fzy -l 5 | xargs '\n' bash -ic"
alias rg="rg -A 3 -B 3"

# history
HISTCONTROL=erasedups:ignoreboth
HISTFILESIZE=-1
HISTSIZE=-1

export HISTIGNORE="&:[  ]*:exit:ls:bg:fg:history:clear"
export PROMPT_COMMAND="history -a"

shopt -s cmdhist
shopt -s histappend
shopt -s globstar

# bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\C-r": "hist \C-j"'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
bind '"\t":   menu-complete'
bind '"\e[Z": menu-complete-backward'
bind '"\C-t": complete'

set show-all-if-unmodified on

# prompt
source ~/.config/bash/prompt.sh
