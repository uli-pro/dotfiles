# Directories

alias assistent='cd /home/uli/Nextcloud/a-projekte/1-uli-persoenlich/claude-assistent'

alias bvs='cd /home/uli/Nextcloud/a-projekte/4-probst-dienstleistungen/software-entwicklung/harvard-cs50/ngue-bvs-app'

alias homeserver='cd /home/uli/Nextcloud/a-projekte/4-probst-dienstleistungen/software-entwicklung/homeserver'

alias coach='cd /home/uli/Nextcloud/a-projekte/1-uli-persoenlich/coach'

alias karten='cd /home/uli/Nextcloud/b-archiv/2-familie/karten'

alias nca='cd /home/uli/Nextcloud/a-projekte'

alias ncb='cd /home/uli/Nextcloud/b-archiv'

alias notizen='cd /home/uli/Nextcloud/_Notizen'

alias books='cd /home/uli/Nextcloud/ebooks-audiobooks'

alias config='cd /home/uli/.config'

#Apps

alias piano='nohup env QT_QPA_PLATFORM=xcb pw-jack "/home/uli/Programme/Pianoteq 9/Pianoteq 9" &>/dev/null &'

alias jjazzlab='setsid flatpak run org.jjazzlab.JJazzLab &>/dev/null &'

alias brave='nohup brave-browser &>/dev/null &'

alias thun='nohup thunar &>/dev/null &'

alias bb='setsid flatpak run eu.betterbird.Betterbird &>/dev/null &'

alias nvf='nvim $(fzf -m --preview "bat --color=always {}")'
alias of='xdg-open "$(fzf --preview "bat --color=always {}")"'
alias typora='nohup ~/Programme/Typora-linux-x64/Typora &>/dev/null &'

# Kalender
alias kal='vdirsyncer sync && khal interactive; vdirsyncer sync'

# Backup

alias backup-mount='mkdir -p /tmp/backup && borg mount ssh://u543865@u543865.your-storagebox.de:23/./desktop-backup /tmp/backup && echo "Backup gemountet unter /tmp/backup"'
alias backup-umount='fusermount -u /tmp/backup && echo "Backup ausgehängt"'
alias backup-list='borgmatic list'
alias backup-status='borgmatic info'
alias backup-now='borgmatic create --verbosity 1 --list'
