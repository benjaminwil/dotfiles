setopt prompt_subst
autoload -U colors && colors

ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%m ' || echo ''
}

git_info() {
  local GIT_LOCATION=${$((git symbolic-ref --short HEAD) 2> /dev/null)}
  local GIT_COLOR="%{$reset_color%}"

  if [ -n "$GIT_LOCATION" ]; then
    if [[ `git status -s` != '' ]]; then
      local GIT_COLOR="%{$fg[yellow]%}"
      local GIT_CHANGES='*' 
    fi
    
    echo " ${GIT_COLOR}${GIT_LOCATION}${GIT_CHANGES}"
  fi
}

local NEWLINE=$'\n'
local PROMPT_COLOR="%{$fg[blue]%}"

PS1='${NEWLINE}$(ssh_info)${PROMPT_COLOR}%~$(git_info)${NEWLINE}${PROMPT_COLOR}%%%{$reset_color%} '

