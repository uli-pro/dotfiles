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

# Backup-Warnung wenn letztes Backup >3 Tage her
if [ -f "$HOME/.local/state/borgmatic-last-backup" ]; then
  _last_backup=$(cat "$HOME/.local/state/borgmatic-last-backup")
  _days_ago=$(( ($(date +%s) - $(date -d "$_last_backup" +%s)) / 86400 ))
  if [ "$_days_ago" -ge 3 ]; then
    echo "WARNUNG: Letztes Backup vor ${_days_ago} Tagen ($_last_backup). 'backup-status' zum Prüfen."
  fi
  unset _last_backup _days_ago
elif [ -d "$HOME/.config/borgmatic" ]; then
  echo "WARNUNG: Noch kein Backup-Heartbeat. 'backup-status' zum Prüfen."
fi
