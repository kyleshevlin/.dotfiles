# Add bin to PATH
export PATH="/usr/local/bin:$PATH"

# Add MySQL to PATH
export PATH="/usr/local/mysql/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load NVM
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# Load Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Turn command line colors on
export CLICOLOR=1

# Set ls command colors
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set Sublime Text as editor
export EDITOR='subl -w'

# Stop Git from asking for merge messages
export GIT_MERGE_AUTOEDIT=no

# React Native Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
