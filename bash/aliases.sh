# CD aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Directory Aliases
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias wk="cd ~/Work"
alias pra="cd ~/Practice"
alias sp="cd ~/SideProjects"

# Command Aliases
alias g="git"
alias e="ember"
alias r="rails"
alias rn="react-native"
alias rni="react-native run-ios"
alias rna="react-native run-android"

# List all, long form
alias la="ls -la"

# Capistrano aliases
alias capdp="cap deploy -S loc=prod"
alias capds="cap deploy -S loc=stage -S branch=stage"
alias capdd="cap deploy -S loc=dev -S branch=dev"
alias cap3dp="cap prod deploy"
alias cap3ds="cap stage deploy"
alias cap3dd="cap dev deploy"
alias capp="cap deploy -S loc=prod || cap prod deploy"
alias caps="cap deploy -S loc=stage -S branch=stage || cap stage deploy"
alias capd="cap deploy -S loc=dev -S branch=dev || cap dev deploy"

# Copy PWD to Clipboard
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"

# Git command aliases that need to run from bash, not gitconfig
alias pl="git copl $(get_git_branch)"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"

# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Update Ember
alias upember="npm uninstall -g ember-cli; npm cache clean; bower cache clean; npm install -g ember-cli"
