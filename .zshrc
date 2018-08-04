# antigen
source ~/.zsh/antigen.zsh

# aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -Glh"

# asdf
source ~/.asdf/asdf.sh

# ctags
if [ "$(uname)" = "Darwin" ]; then
  alias ctags="`brew --prefix`/bin/ctags -R -f ./.tags ."
else
  alias ctags="ctags -R -f ./.tags ."
fi

# direnv
if [[ -d /usr/local/bin/direnv ]]; then eval "$(direnv hook zsh)"; fi

# functions
fpath=(~/.zsh/functions $fpath)

# history
HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.zsh_history

# keybinding
bindkey -e

# prompt
source ~/.zsh/prompt.zsh
