# antigen
source ~/.zsh/antigen.zsh

# aliases
alias dotfiles="command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -Glh"

# asdf
if ! [ -x $(command -v asdf) ]; then source ~/.asdf/asdf.sh; fi

# ctags
if [ "$(uname)" = "Darwin" ]; then
  alias ctags="`brew --prefix`/bin/ctags -R -f ./.tags ."
else
  alias ctags="ctags -R -f ./.tags ."
fi

# direnv
if ! [ -x $(command -v direnv) ]; then eval "$(direnv hook zsh)"; fi

# functions
fpath=(~/.zsh/functions $fpath)

# history
HISTSIZE=999999999
SAVEHIST=999999999
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY

# keybinding
bindkey -e

# private
source ~/.zsh/private.zsh

# prompt
source ~/.zsh/prompt.zsh
