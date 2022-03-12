#!/bin/sh

# Location to store all files relevant to this application
installation_dir=/usr/share/discordaudioshare
# Location where user "bin" packages are installed
bin_dir=/usr/bin

# Create the installation directory if doesn't exist
sudo mkdir -p $installation_dir
sudo mkdir -p $bin_dir

# Copy files to installation director
sudo cp shareaudio.sh shareaudioprompt.sh stopshareaudio.sh toggleaudioshare.sh $installation_dir

# Install command
sudo bash -c "echo '#!/bin/sh' > $bin_dir/discordaudioshare"
sudo bash -c "echo 'bash $installation_dir/toggleaudioshare.sh' >> $bin_dir/discordaudioshare"
sudo chmod +x $bin_dir/discordaudioshare

output_devices=$(pactl list short sinks | cut -f 2)
input_devices=$(pactl list short sources | cut -f 2)

if ! command -v rofi &> /dev/null
then
    echo "DiscordAudioShare depends on rofi"
    echo "Please install rofi (https://github.com/davatorium/rofi)"
    exit
fi

if ! command -v pactl &> /dev/null
then
    echo "pactl not found"
    echo "DiscordAudioShare works with pulseaudio"
    echo "Please install pulseaudio to use this application"
    exit
fi

printf "Configure audio share\n\n"

echo "Audio output found -"
PS3="Choose output device to be used: "

select output_device in ${output_devices[@]}; do  
    if test -z "$output_device"; then
        echo "Invalid device selected"
        exit
    fi

    echo
    
    echo "Audio input found -"
    PS3="Choose input device to be used: "
    
    select input_device in ${input_devices[@]}; do
        if test -z "$input_device"; then
            echo "Invalid device selected"
            exit
        fi
        break
    done
    break
done

if [[ $XDG_CONFIG_HOME ]]; then
    config_dir=$XDG_CONFIG_HOME/discordaudioshare
elif [[ $HOME ]]; then
    config_dir=$HOME/.config/discordaudioshare
else
    echo "Unable to get config home"
fi

mkdir -p $config_dir

config_file=$config_dir/devices.sh

echo "audio_output=$output_device" > $config_file
echo "mic_input=$input_device" >> $config_file

echo "Done"
