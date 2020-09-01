[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/.scripts:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar:/bin:$PATH
export WEECHAT_HOME=$HOME/.config/weechat/

export EDITOR='vim'
export VISUAL='vim'

[ -f /usr/local/etc/bash_completion  ] && . /usr/local/etc/bash_completion

# asdf version manager
if [ -e $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi

# bundler (for ruby)
source ~/.config/bundler/global.sh

# nix package manager
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# private
if [ -e $HOME/.config/bash/private.sh ]; then
    . $HOME/.config/bash/private.sh
else
    echo "~/.bashrc: Initializing ~/.config/bash/private.sh 👌" && \
      touch $HOME/.config/bash/private.sh
fi

