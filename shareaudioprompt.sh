#!/bin/sh
my_dir=$(dirname "$0")
# Get input using a rofi prompt
APP_NAME=$(pactl list short clients | cut -f 3 | tail -n +2 | sort -u | rofi -dmenu -p "Select Application")

IS_VALID=$(pactl list short clients | cut -f 3 | tail -n +2 | grep $APP_NAME)

# If input application received
if [[ $IS_VALID ]]; then
    if [[ $APP_NAME ]]; then
        bash $my_dir/shareaudio.sh $APP_NAME
    fi
fi
