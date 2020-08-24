[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/.scripts:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar:/bin:$PATH

export EDITOR='vim'
export VISUAL='vim'

# asdf version manager
if [ -e $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi

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
