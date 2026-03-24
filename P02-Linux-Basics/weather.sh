#!/bin/bash

CITY=${1:-Perm}
LAT=58.0105
LON=56.2502

OUTPUT_FILE="/var/www/html/index.html"

# Получаем погоду
WEATHER_DATA=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=${LAT}&longitude=${LON}&current=temperature_2m,relative_humidity_2m&timezone=auto")

# Парсим JSON
TEMP=$(echo "$WEATHER_DATA" | jq -r '.current.temperature_2m')
HUMIDITY=$(echo "$WEATHER_DATA" | jq -r '.current.relative_humidity_2m')

# Используем английский формат
CURRENT_DATE=$(LC_ALL=C date -u)

# Записываем в index.html
echo "\"$TEMP\" \"$HUMIDITY\" $CURRENT_DATE" > "$OUTPUT_FILE"

# Выводим в консоль
echo "\"$TEMP\" \"$HUMIDITY\" $CURRENT_DATE"
