#!/bin/bash
pactl unload-module module-null-sink
pactl unload-module module-loopback
paplay /usr/share/sounds/freedesktop/stereo/service-logout.oga &
