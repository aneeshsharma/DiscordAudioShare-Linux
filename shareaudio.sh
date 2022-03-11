#!/bin/bash

#app_name="TowerOfTime.x86_64"
app_name="$1"


# grabbing of the hardware audio output device id
audio_output=$(pactl list sinks | grep "Name:" |grep "USB"| head -1 | perl -pe 's/^.*?Name: (.*)$/$1/')

# grabbing of microphone device id
mic_input=$(pactl list sources | grep "Name:" | grep "USB" | tail -1 | perl -pe 's/^.*?Name: (.*)$/$1/')

# grabbing sink input id for specified application name
app_id=$(pactl list sink-inputs | perl -0x00 -ne '''
my $appName     = "'${app_name}'"; 
my $appId       = ""; 
my @sink_inputs = split(/Sink Input/, $_);

foreach my $input (@sink_inputs) { 
    if ($input =~ /$appName/) { 
        $appId = $input =~ s/^.*#([0-9]+).*$/$1/msr; 
        break; 
    } 
} 

print "$appId\n";
''')

# grabbing sink input id for Discord
discord_id=$(pactl list source-outputs | perl -0x00 -ne '''
my $appName     = "Discord"; 
my $appId       = ""; 
my @source_outputs = split(/Source Output/, $_);

foreach my $output (@source_outputs) { 
    if ($output =~ /$appName/) { 
        $appId = $output =~ s/^.*#([0-9]+).*$/$1/msr; 
        break; 
    } 
} 

print "$appId\n";
''')

# 2 null sinks used as buffers
pactl load-module module-null-sink sink_name=MicPlusGame sink_properties=device.description="MicPlusGame"
pactl load-module module-null-sink sink_name=GameOnly sink_properties=device.description="GameOnly"

# 1 loopback to hw audio output for isolated game sound

pactl load-module module-loopback source=GameOnly.monitor sink=${audio_output}


# 2 loopbacks to "MicPlusGame"; 1 for microphone, 1 for game sound
pactl load-module module-loopback source=${mic_input} sink=MicPlusGame 
pactl load-module module-loopback source=GameOnly.monitor sink=MicPlusGame

# redirecting, could also be done in pulse audio gui 
pactl move-source-output ${discord_id} MicPlusGame.monitor
pactl move-sink-input ${app_id} GameOnly
