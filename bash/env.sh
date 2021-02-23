# Add bin to PATH
export PATH="/usr/local/bin:$PATH"

# Add MySQL to PATH
export PATH="/usr/local/mysql/bin:$PATH"

# Load NVM
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# Load Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Turn command line colors on
export CLICOLOR=1

# Set ls command colors
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set VSCode as editor
export EDITOR='code -w'

# Stop Git from asking for merge messages
export GIT_MERGE_AUTOEDIT=no

# Stop bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

