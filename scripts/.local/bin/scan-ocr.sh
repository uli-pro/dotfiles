#!/bin/bash
# OCR-Nachbearbeitung für simple-scan
# $1 = MIME-Type, $2 = keep original, $3 = Dateiname

filename=$3

/usr/bin/ocrmypdf --deskew --clean --force-ocr -l deu "$filename" "$filename" &> /tmp/ocr.log

if [ $? -ne 0 ]; then
    notify-send "OCR fehlgeschlagen. Siehe /tmp/ocr.log"
    exit 1
fi

notify-send "OCR fertig"
