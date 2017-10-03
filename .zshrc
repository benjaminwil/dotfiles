source ~/.zsh/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/functions.zsh
antigen bundle robbyrussell/oh-my-zsh lib/termsupport.zsh
antigen bundle robbyrussell/oh-my-zsh lib/theme-and-appearance.zsh
antigen bundle robbyrussell/oh-my-zsh plugins/git
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply

HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.zsh_history

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gitf="git log --pretty=full"
alias ls="ls -lh"
alias exa="exa -lgB --git -s type"

export EDITOR=/usr/bin/vim
export GEM_HOME=$HOME/.gem
export PATH=/usr/local/bin:$HOME/.gem/bin:$HOME/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' hosts off

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
