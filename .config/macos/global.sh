# Set up Homebrew in the shell if it's installed.
[ -f /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)

# Set up Rust if it's installed via Homebrew.
if [ -f /opt/homebrew/opt/rustup/bin ]
then
    export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
fi

# It is sometimes nice to have GNU-like coreutils installed on macOS so `sed` is
# less weird, and so on.
if [ -f /opt/homebrew/opt/corutils/libexec/gnubin ]
then
    export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi

# In development mode, sometimes Rails gets really made if the following
# environment variable is missing. More info:
#
#   https://stackoverflow.com/questions/52671926/rails-may-have-been-in-progress-in-another-thread-when-fork-was-called
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
