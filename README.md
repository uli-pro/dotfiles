# dotfiles

GNU Stow-managed dotfiles for Fedora 43 Sway Spin.

## Packages

| Package | Description |
|---------|-------------|
| bash | .bashrc, .bash_profile, .bash_aliases |
| git | .gitconfig, global gitignore |
| tmux | Terminal multiplexer |
| sway | Window manager |
| waybar | Status bar |
| foot | Terminal emulator |
| fuzzel | Application launcher |
| mako | Notification daemon |
| nvim | Neovim (LazyVim) |
| pipewire | PipeWire audio config |
| wireplumber | WirePlumber session manager |
| pianoteq-autolink | Pianoteq autoconnect (systemd + script) |
| scripts | Custom shell scripts |

## Usage

```bash
# Install all:
cd ~/dotfiles && stow */

# Single package:
cd ~/dotfiles && stow bash

# Remove:
cd ~/dotfiles && stow -D bash

# Re-stow:
cd ~/dotfiles && stow -R bash
```
