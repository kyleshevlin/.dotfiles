# Add bin to PATH
export PATH="/usr/local/bin:$PATH"

# Add MySQL to PATH
export PATH="/usr/local/mysql/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add NVM and load it
export NVM_DIR="/Users/kyle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

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
