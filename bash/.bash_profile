# Source .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User binaries (pipx, etc.)
export PATH="$HOME/.local/bin:$PATH"
