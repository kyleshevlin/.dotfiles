# Initial prompt format
PS1='\h:\W \u\$ '

# Full prompt command
PROMPT_COMMAND='PS1="\n${c_user}\u: ${c_path}\W${c_reset}$(node_prompt)${c_reset}$(git_prompt)\n${c_reset}⚡ "'

# For screencasts
# PROMPT_COMMAND='PS1="\n${c_user}\u: ${c_path}\W\n${c_reset}⚡ "'
