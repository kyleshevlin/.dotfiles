# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git Tab Completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Grunt Tab Completion
eval "$(grunt --completion=bash)"
