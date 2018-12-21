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

# find-up and cdnvm are used to automatically switch node versions
# when a .nvmrc file is detected.
function find-up () {
  path=$(pwd)
  while [[ "$path" != "" && ! -e "$path/$1" ]]; do
    path=${path%/*}
  done
  echo "$path"
}

function cdnvm () {
  cd $@;
  nvm_path=$(find-up .nvmrc | tr -d '[:space:]')

  # If there are no .nvmrc file, use the default nvm version
  if [[ ! $nvm_path = *[^[:space:]]* ]]; then
    declare default_version;
    default_version=$(nvm version default);

    # If there is no default version, set it to `node`
    # This will use the latest version on your machine
    if [[ $default_version == "N/A" ]]; then
      nvm alias default node;
      default_version=$(nvm version default);
    fi

    # If the current version is not the default version, set it to use the default version
    if [[ $(nvm current) != "$default_version" ]]; then
      nvm use default;
    fi

    elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
    declare nvm_version
    nvm_version=$(<"$nvm_path"/.nvmrc)

    # Add the `v` suffix if it does not exists in the .nvmrc file
    if [[ $nvm_version != v* ]]; then
      nvm_version="v""$nvm_version"
    fi

    # If it is not already installed, install it
    if [[ $(nvm ls "$nvm_version" | tr -d '[:space:]') == "N/A" ]]; then
      nvm install "$nvm_version";
    fi

    if [[ $(nvm current) != "$nvm_version" ]]; then
      nvm use "$nvm_version";
    fi
  fi
}
alias cd='cdnvm'
