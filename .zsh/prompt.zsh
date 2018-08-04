setopt prompt_subst
autoload -U colors && colors

ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%m ' || echo ''
}

git_info() {
  local GIT_BRANCH=${$((git symbolic-ref --short HEAD) 2> /dev/null)}
  local GIT_COLOR="%{$reset_color%}"
  local GIT_DIR=${$((git rev-parse --git-dir) 2> /dev/null)}

  if [ -n "$GIT_BRANCH" ]; then
    if [[ `git status --short` != '' ]]; then
      local GIT_COLOR="%{$fg[yellow]%}"
      local GIT_CHANGES='*'
    fi
  fi

  if [ -d "$GIT_DIR/rebase-merge" ]; then
    local GIT_COLOR="%{$fg[red]%}"
    local GIT_REBASE_MSG="rebase"
  fi

  echo " ${GIT_COLOR}${GIT_REBASE_MSG}${GIT_BRANCH}${GIT_CHANGES}"
}

local NEWLINE=$'\n'
local PROMPT_COLOR="%{$fg[blue]%}"

PS1='${NEWLINE}$(ssh_info)${PROMPT_COLOR}%~$(git_info)${NEWLINE}${PROMPT_COLOR}⌓%{$reset_color%} '

