# antigen
source ~/.zsh/antigen.zsh

# aliases
alias dotfiles="command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -Glh"

# asdf
source ~/.asdf/asdf.sh

# colours
export TERM=screen-256color

# ctags
if [ "$(uname)" = "Darwin" ]; then
  alias ctags="`brew --prefix`/bin/ctags -R -f ./.tags ."
else
  alias ctags="ctags -R -f ./.tags ."
fi

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

# man colorscheme
source ~/.zsh/man.zsh

# private
if [ -e ~/.zsh/private.zsh ]; then
  source ~/.zsh/private.zsh
else
  cat ~/.zsh/benjaminwil.txt
  echo "Initializing ~/.zsh/private.zsh 👌" && touch ~/.zsh/private.zsh
fi

# prompt
source ~/.zsh/prompt.zsh
