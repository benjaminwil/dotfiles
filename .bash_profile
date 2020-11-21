[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/.scripts:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar:/bin:$PATH
export WEECHAT_HOME=$HOME/.config/weechat/

export EDITOR='vim'
export VISUAL='vim'

[ -f /usr/local/etc/bash_completion  ] && . /usr/local/etc/bash_completion

# asdf version manager
[ -e $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh

# bundler (for ruby)
source $HOME/.config/bundler/global.sh

# macos only
[[ "$OSTYPE" == "darwin"* ]] && . $HOME/.config/macos/global.sh

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

