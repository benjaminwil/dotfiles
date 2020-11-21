source ~/.config/bash/ansi.sh

PROMPT_COLOR=${ANSI_COLOR_BLUE}

current_dir() {
  basename "$PWD"
}

git_info() {
    local GIT_BRANCH=$(git symbolic-ref --short HEAD 2> /dev/null)
    local GIT_COLOR="${ANSI_COLOR_NORMAL}"
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
    [[ "$SSH_CONNECTION" != '' ]] && echo '%m ' || echo ''
}

PS1="
\[$(ssh_info)\]\[${PROMPT_COLOR}\]\[\$(current_dir)\]\[\$(git_info)\]
\[${PROMPT_COLOR}\]⅋ \[${ANSI_COLOR_NORMAL}\]"

