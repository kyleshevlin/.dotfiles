# Initial prompt format
PS1='\h:\W \u\$ '

# Full prompt command
PROMPT_COMMAND='PS1="${c_user}\u: ${c_path}\w${c_reset}$(git_prompt) ${c_reset}\$ "'
