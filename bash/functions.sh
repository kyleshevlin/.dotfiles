# Get the current git branch
get_git_branch() {
  local branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo $branch
}

# Assemble the Git part of prompt
git_prompt () {
  # Not Git, don't add to prompt
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(get_git_branch)

  if git diff --quiet 2>/dev/null >&2; then
    git_color="$c_git_clean"
  else
    git_color="$c_git_dirty"
  fi

  echo " [$git_color$git_branch${c_reset}]"
}

# Get Node Version
get_node_version () {
  echo $(node -v)
}

# Add Node to prompt
node_prompt () {
  echo " $c_node_version$(get_node_version)"
}

# Make a directory && cd into that directory
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# Rename all directories to lowercase
function mvdirslower () {
  for f in *; do
    if [[ -d "$f" && ! -L "$f" ]]; then
      local LOWERDIR="$( echo $f | tr '[:upper:]' '[:lower:]')"

      if [[ "$f" != "$LOWERDIR" ]]; then
        mv "$f" "$LOWERDIR" && echo "$f has been lowercased to $LOWERDIR"
      fi
    fi
  done
}

# Merge and deploy all branches - Unlikely to be used now
function mgdep () {
  if [ $# -eq 0 ]; then
      branch=$(get_git_branch)
  else
    branch=$1
  fi

  git copl master && echo -e "\033[0;32mMaster checked out and pulled\033[0m"
  git mg $branch && echo -e "\033[0;32m${branch} merged into master\033[0m"
  git phom && echo -e "\033[0;32m${branch} pushed to master\033[0m"
  capp && echo -e "\033[0;32m${branch} deployed to prod via master branch\033[0m"
  git copl stage && echo -e "\033[0;32mStage checked out and pulled\033[0m"
  git mg $branch && echo -e "\033[0;32m${branch} merged into stage\033[0m"
  git phos && echo -e "\033[0;32m${branch} pushed to stage\033[0m"
  caps && echo -e "\033[0;32m${branch} deployed to stage via stage branch\033[0m"
  git copl dev && echo -e "\033[0;32mDev checked out and pulled\033[0m"
  git mg $branch && echo -e "\033[0;32m${branch} merged into dev\033[0m"
  git phod && echo -e "\033[0;32m${branch} pushed to dev\033[0m"
  capd && echo -e "\033[0;32m${branch} deployed to dev via dev branch\033[0m"
  git co master && terminal-notifier -message 'Deploys completed. Master checked out.' -sound 'default'
}
alias mede="mgdep"

# Create a new rvm gemset, touch a .rvmrc file, and write to .rvmrc file
function creatervm () {
  local version_and_name=$1

  rvm use $version_and_name --create
  touch .rvmrc
  echo "rvm use ruby-${version_and_name}" > .rvmrc
}
alias crvm="creatervm"

# Run the WP Parser on a given file
function wpparse () {
  local file_name=$1
  ruby -r "/Users/kyle/Projects/wpparser/wpparser.rb" -e "WPParser.new.parse '${file_name}'"
}

function nametab () {
  echo -ne "\033]0;"$@"\007"
}
alias nt="nametab"
