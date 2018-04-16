# antigen
source ~/.zsh/antigen/antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/functions.zsh
antigen bundle robbyrussell/oh-my-zsh lib/termsupport.zsh
antigen bundle zdharma/fast-syntax-highlighting
antigen apply

# aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -Glh"
alias gfzf="grep --line-buffered --color=never -r \"\" * | fzf"

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

# fzf / rg
autoload fd
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob \"!.git/*\""
export FZF_DEFAULT_OPTS="--height 20"

# history
HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.zsh_history

# paths
typeset -U path

# prompt
source ~/.zsh/prompt.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
