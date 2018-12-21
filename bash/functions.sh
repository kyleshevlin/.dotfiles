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
