source ~/.config/bash/ansi.sh

PROMPT_COLOR=${ANSI_COLOR_BLUE}

current_dir() {
  basename "$PWD"
}

suspended_jobs() {
  local count=`jobs -s | wc -l | sed -e "s/ //g"`

  if [ $count -ne 0 ]; then
    echo " $ANSI_COLOR_MAGENTA($count)$ANSI_COLOR_NORMAL"
  fi
}

nix_shell_info() {
  if [ -n "$IN_NIX_SHELL" ]
  then
    printf "${ANSI_COLOR_YELLOW}★${ANSI_COLOR_NORMAL} "
  fi
}

git_info() {
    local GIT_BRANCH=$(git symbolic-ref --short HEAD 2> /dev/null)
    local GIT_COLOR="${ANSI_COLOR_CYAN}"
    local GIT_COMMIT=$(git rev-parse --short HEAD 2> /dev/null)
    local GIT_DIR=$(git rev-parse --git-dir 2> /dev/null)
    local GIT_TAG=$(git describe --tags 2> /dev/null)

    if [ -n "$GIT_BRANCH" ]; then
        if [[ `git status --short` != '' ]]; then
            local GIT_COLOR=${ANSI_COLOR_YELLOW}
            local GIT_DISPLAY=${GIT_BRANCH}
            local GIT_CHANGES='*'
        else
            local GIT_DISPLAY=${GIT_BRANCH}
        fi
    elif [ -n "$GIT_TAG" ]; then
        local GIT_COLOR=${ANSI_COLOR_GREEN}
        local GIT_DISPLAY=${GIT_TAG}
    else
        local GIT_DISPLAY=${GIT_COMMIT}
    fi

    if [ -d "$GIT_DIR/rebase-merge" ]; then
        local GIT_COLOR=${ANSI_COLOR_RED}
        local GIT_DISPLAY="rebase"
    fi

    if [ -d "$GIT_DIR/rebase-apply" ]; then
        local GIT_COLOR=${ANSI_COLOR_RED}
        local GIT_DISPLAY="rebase-apply"
    fi

    echo " ${GIT_COLOR}${GIT_DISPLAY}${GIT_CHANGES}"
}

ssh_info() {
    [[ "$SSH_CONNECTION" != '' ]] && echo '$(hostname) ' || echo ''
}

PS1="
\[$(nix_shell_info)\]\[$(ssh_info)\]\[${PROMPT_COLOR}\]\[\$(current_dir)\]\[\$(git_info)\]\[\$(suspended_jobs)\]
\[${PROMPT_COLOR}\]⅋ \[${ANSI_COLOR_NORMAL}\]"
