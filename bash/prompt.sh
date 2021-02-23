# Initial prompt format
PS1='\h:\W \u\$ '

auto_nvm_use(){
  # Exit early if we're in the same directory as before
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi
  PREV_PWD=$PWD

  [[ -f '.nvmrc' ]] && nvm use
}

setup(){
  auto_nvm_use

  # Normal full prompt
  PS1="\n${c_user}\u: ${c_path}\W${c_reset}$(node_prompt)${c_reset}$(git_prompt)\n${c_reset}\$ "

  # For screencasts
  # PS1="\n${c_user}\u: \n${c_reset}\$ "
}

PROMPT_COMMAND=setup
