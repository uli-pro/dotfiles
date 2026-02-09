#!/bin/bash
# System-Snapshot: Erfasst den aktuellen Systemzustand vor jedem Backup
# Wird durch borgmatic before_backup Hook aufgerufen

OUTDIR="/home/uli/Nextcloud/a-projekte/1-uli-persoenlich/claude-assistent/backup"
mkdir -p "$OUTDIR"

echo "System-Snapshot gestartet: $(date)"

dnf list installed > "$OUTDIR/dnf-packages.txt" 2>/dev/null
flatpak list --app > "$OUTDIR/flatpak-apps.txt" 2>/dev/null
systemctl --user list-unit-files --state=enabled > "$OUTDIR/user-services.txt" 2>/dev/null
getent group | grep uli > "$OUTDIR/group-memberships.txt" 2>/dev/null

echo "System-Snapshot abgeschlossen: $(date)"
