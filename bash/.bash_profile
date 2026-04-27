# Source .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User binaries (pipx, etc.)
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
