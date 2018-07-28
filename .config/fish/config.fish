# asdf version manager
source ~/.asdf/asdf.fish

# aliases
alias dotfiles "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls "ls -Glh"

# direnv
if which direnv; eval (direnv hook fish); end

# path
set -gx PATH /usr/local/Cellar /usr/local/bin $HOME/Scripts $PATH
