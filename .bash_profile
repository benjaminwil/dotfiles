[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.scripts:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar:$PATH
export WEECHAT_HOME=$HOME/.config/weechat/

# If the ASDF version manager is installed, integrate it with the shell.
[ -e $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh

# Load global Bundler configuration (for Ruby development environments).
source $HOME/.config/bundler/global.sh

# Load macOS-specific stuff if we're using macOS.
[[ "$OSTYPE" == "darwin"* ]] && . $HOME/.config/macos/global.sh

# If we're on a system using Nix, set Nix-specific settings.
if [ -n "$NIX_PROFILES" ]
then
    export NIX_SHELL_PRESERVE_PROMPT=1
fi

# Set the editor to Kakoune and load Kakoune-related executables if Kakoune is
# installed.
if command -v kak &> /dev/null
then
    export EDITOR='kak'
    export VISUAL='kak'

    PATH="$HOME/.config/kak/bin/:$PATH"
fi

# We don't like to commit private stuff to the dotfiles repository.
if [ -e $HOME/.config/bash/private.sh ]
then
    . $HOME/.config/bash/private.sh
else
    echo "~/.bashrc: Initializing ~/.config/bash/private.sh 👌" && \
        touch $HOME/.config/bash/private.sh
fi
