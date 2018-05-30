# antigen
source ~/.zsh/antigen/antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/functions.zsh
antigen bundle robbyrussell/oh-my-zsh lib/termsupport.zsh
antigen bundle zdharma/fast-syntax-highlighting
antigen apply

# aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -Glh"

# chruby
if [[ -d /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby ruby-2.4.4
fi

# ctags
if [ "$(uname)" = "Darwin" ]; then
  alias ctags="`brew --prefix`/bin/ctags -R -f ./.tags ."
else
  alias ctags="ctags -R -f ./.tags ."
fi

# functions
fpath=(~/.zsh/functions $fpath)

# history
HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.zsh_history

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# prompt
source ~/.zsh/prompt.zsh
