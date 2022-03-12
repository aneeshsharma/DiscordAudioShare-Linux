#!/bin/bash

my_dir=$(dirname "$0")
if [[ $(pactl list short modules | grep GameOnly) ]]; then
    bash $my_dir/stopshareaudio.sh
else
    bash $my_dir/shareaudioprompt.sh
fi
    
