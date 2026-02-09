# Aliases are in ~/.bash_alises
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# fzf key bindings and completion
if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
    source /usr/share/fzf/shell/key-bindings.bash
fi

# Prompt
PS1='\W \$ '

# Editor
export EDITOR=nvim
export VISUAL=nvim
