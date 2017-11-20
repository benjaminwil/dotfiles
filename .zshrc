# antigen
source ~/.zsh/antigen/antigen.zsh
antigen apply

# aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -Glh"

# history
HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.zsh_history

# paths
export EDITOR=/usr/bin/vim
export GEM_HOME=$HOME/.gem
export PATH=/usr/local/Cellar:/usr/local/bin:$HOME/.gem/bin:$HOME/bin:$PATH
