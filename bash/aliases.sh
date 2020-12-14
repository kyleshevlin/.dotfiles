# CD aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# NPM Aliases
alias nrb="npm run build"
alias nrs="npm run start"
alias nrt="npm run test"
alias nrtw="npm run test:watch"
alias nrd="npm run deploy"

# Directory Aliases
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias wk="cd ~/Work"
alias pra="cd ~/Practice"
alias sp="cd ~/SideProjects"

# Trash instead of rm
alias rm="trash"

# List all, long form
alias la="ls -la"

# Clear the pane
alias kl="clear"

# Copy PWD to Clipboard
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"

# Cat package.json
alias catpac="cat package.json"
alias ctpc="catpac"

# Git command aliases that need to run from bash, not gitconfig
alias pl="git copl $(get_git_branch)"

# Recursively delete `.DS_Store` files
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

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

# Launch VSCode in teaching mode
alias teach="code --extensions-dir ~/code_profiles/egghead/exts --user-data-dir ~/code_profiles/egghead/data"

# Get to work
alias blog="cd ~/Work/blog && code ."
alias jed="cd ~/JustEnoughDev/website && code ."

# Open my brag document
alias brag="code ~/Desktop/BRAG_DOC_2020.md"

# Open my todos/where I left off document
alias todo="code ~/Desktop/WHERE_I_LEFT_OFF.md"

# Webflow specific aliases
alias yf="yarn flow"
alias yrtw="yarn run jest:watch"
alias yrc="yarn run cypress-ui"

# Docker Containers
alias dockerstopall="docker stop $(docker ps -q)"
alias dockerkillall="docker kill $(docker ps -q)"
