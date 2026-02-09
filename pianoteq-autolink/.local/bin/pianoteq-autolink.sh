#!/bin/bash
# Automatische Verbindung Pianoteq → iConnectAUDIO4+
# Wird alle 5 Sekunden via systemd-Timer aufgerufen

PIANOTEQ_OUT1="Pianoteq:out_1"
PIANOTEQ_OUT2="Pianoteq:out_2"
ICONNECT_IN1="alsa_output.usb-iConnectivity_iConnectAUDIO4__00000E14-00.pro-output-0:playback_AUX0"
ICONNECT_IN2="alsa_output.usb-iConnectivity_iConnectAUDIO4__00000E14-00.pro-output-0:playback_AUX1"

# Nur wenn Pianoteq-Ports existieren
if pw-link -o 2>/dev/null | grep -q "^${PIANOTEQ_OUT1}$"; then
    # Nur wenn iConnectivity-Ports existieren
    if pw-link -i 2>/dev/null | grep -q "playback_AUX0"; then
        # Link erstellen (pw-link ignoriert bereits bestehende Links stillschweigend)
        pw-link "$PIANOTEQ_OUT1" "$ICONNECT_IN1" 2>/dev/null
        pw-link "$PIANOTEQ_OUT2" "$ICONNECT_IN2" 2>/dev/null
    fi
fi
