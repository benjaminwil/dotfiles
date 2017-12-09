# antigen
source ~/.zsh/antigen/antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/functions.zsh
antigen bundle robbyrussell/oh-my-zsh lib/termsupport.zsh
antigen bundle zdharma/fast-syntax-highlighting
antigen apply

# aliases
alias ctags="ctags -R -f ./.ctags ."
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -Glh"

# chruby
if [[ -d /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

# history
HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.zsh_history

# paths
export GEM_HOME=$HOME/.gem
export PATH=/usr/local/Cellar:/usr/local/bin:$HOME/.gem/bin:$HOME/bin:$PATH

# prompt
source ~/.zsh/prompt.zsh
