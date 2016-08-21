source ~/.zsh/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/theme-and-appearance.zsh
antigen bundle robbyrussell/oh-my-zsh plugins/git
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.zsh_history

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -lh"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' hosts off

source $(brew --prefix nvm)/nvm.sh
