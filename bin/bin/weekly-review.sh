#!/bin/bash
# weekly-review.sh - Wochen-Review Layout auf zwei Monitoren aufbauen
#
# Monitor 1 (HDMI-A-1): Betterbird | Todoist / Neovim (Reflexion)
# Monitor 2 (DP-1):     Claude Code / Yazi | LibreOffice Calc (Wochenplan)

COACH_DIR="$HOME/Nextcloud/a-projekte/1-uli-persoenlich/coach"
REVIEW_FILE="$COACH_DIR/woechentliche-reflexion.md"
PLAN_FILE="$COACH_DIR/zwj01/wochenplaene.ods"

# --- Monitor 1 (HDMI-A-1): Workspace 1 ---
swaymsg 'workspace 1; move workspace to output HDMI-A-1'

flatpak run eu.betterbird.Betterbird &
sleep 2

flatpak run com.todoist.Todoist &
sleep 2

# Todoist-Bereich vertikal splitten, Neovim darunter
swaymsg '[app_id="Todoist"] focus; splitv'
foot --app-id=review-nvim -e nvim "$REVIEW_FILE" &
sleep 1

# --- Monitor 2 (DP-1): Workspace 2 ---
swaymsg 'workspace 2; move workspace to output DP-1'

foot --app-id=review-claude --working-directory="$COACH_DIR" &
sleep 1

libreoffice --calc "$PLAN_FILE" &
sleep 2

# Claude-Code-Terminal vertikal splitten, Yazi darunter
swaymsg '[app_id="review-claude"] focus; splitv'
foot --app-id=review-yazi -e yazi "$COACH_DIR" &
sleep 1

echo "Weekly Review Layout fertig."
