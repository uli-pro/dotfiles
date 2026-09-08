#!/usr/bin/env bash
# Wetter für Waybar (custom/wetter) — Open-Meteo, kein API-Key nötig
# Standort: Pohlheim-Watzenborn-Steinberg
export LC_NUMERIC=C
LAT=50.556
LON=8.715

URL="https://api.open-meteo.com/v1/forecast?latitude=${LAT}&longitude=${LON}"
URL+="&current=temperature_2m,precipitation,weather_code"
URL+="&daily=temperature_2m_min,temperature_2m_max,precipitation_sum,precipitation_probability_max"
URL+="&forecast_days=1&timezone=Europe%2FBerlin"

data=$(curl -sf -m 10 "$URL") || {
    echo '{"text": "Wetter n/a", "class": "error", "tooltip": "Open-Meteo nicht erreichbar"}'
    exit 0
}

wmo_text() {
    case "$1" in
        0) echo "Klar" ;;
        1) echo "Überwiegend klar" ;;
        2) echo "Teilweise bewölkt" ;;
        3) echo "Bedeckt" ;;
        45|48) echo "Nebel" ;;
        51|53|55) echo "Nieselregen" ;;
        56|57) echo "Gefrierender Nieselregen" ;;
        61|63|65) echo "Regen" ;;
        66|67) echo "Gefrierender Regen" ;;
        71|73|75) echo "Schneefall" ;;
        77) echo "Schneegriesel" ;;
        80|81|82) echo "Regenschauer" ;;
        85|86) echo "Schneeschauer" ;;
        95) echo "Gewitter" ;;
        96|99) echo "Gewitter mit Hagel" ;;
        *) echo "Unbekannt ($1)" ;;
    esac
}

temp=$(jq -r '.current.temperature_2m' <<<"$data")
precip=$(jq -r '.current.precipitation' <<<"$data")
code=$(jq -r '.current.weather_code' <<<"$data")
tmin=$(jq -r '.daily.temperature_2m_min[0]' <<<"$data")
tmax=$(jq -r '.daily.temperature_2m_max[0]' <<<"$data")
psum=$(jq -r '.daily.precipitation_sum[0]' <<<"$data")
pprob=$(jq -r '.daily.precipitation_probability_max[0]' <<<"$data")
zeit=$(jq -r '.current.time' <<<"$data" | cut -dT -f2)

text=$(printf '%.0f°C %smm %s%%' "$temp" "$precip" "$pprob")
nl=$'\n'
tooltip="Pohlheim-Watzenborn-Steinberg ($zeit)${nl}$(wmo_text "$code")${nl}Aktuell: ${temp}°C, Niederschlag ${precip} mm/h${nl}Heute: ${tmin}–${tmax}°C, ${psum} mm, Regenwahrsch. max. ${pprob} %"

class="dry"
[ "$(jq -r '.current.precipitation > 0' <<<"$data")" = "true" ] && class="rain"

jq -cn --arg t "$text" --arg tt "$tooltip" --arg c "$class" \
    '{text: $t, tooltip: $tt, class: $c}'
