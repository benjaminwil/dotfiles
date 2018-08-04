source ~/.zsh/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/functions.zsh
antigen bundle robbyrussell/oh-my-zsh lib/termsupport.zsh
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

# zsh-history-substring-search configuration
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

