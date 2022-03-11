my_dir=$(dirname "$0")
if [[ $(pactl list short modules | grep GameOnly) ]]; then
    $my_dir/stopshareaudio.sh
else
    $my_dir/shareaudioprompt.sh
fi
    
