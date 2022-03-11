#!/bin/bash
$(pactl unload-module module-null-sink)
$(pactl unload-module module-loopback)
