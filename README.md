# Discord Audio Share on Linux

A simple utility allowing you to share audio when using discord on linux. This
works by routing your application audio and your mic input into a single audio
source, which is then used by discord as the input device.

## Installation

This utility uses [Rofi](https://github.com/davatorium/rofi) to create a prompt
to select an application. Follow the [installation instructions](https://github.com/davatorium/rofi/blob/next/INSTALL.md#install-distribution)
to install rofi.

Clone this repository to any directory you like

```bash
git clone https://github.com/aneeshsharma/DiscordAudioShare-Linux
```

Now, running `toggleaudioshare.sh` should open a prompt asking you to select an
application to share your audio with. Running this again would stop sharing the
audio (Hence, "toggle")

I recommend setting a keyboard shortcut to this script. Using [`sxhkd`](https://github.com/baskerville/sxhkd),
you can add the following

```sxhkd
super + a
    /path/to/DiscordAudioShare-Linux/toggleaudioshare.sh
```

## Usage

When running `toggleaudioshare.sh`, a prompt shows up asking you to select an application.
You can select the application you want to share audio of from there. Make sure
the application is playing audio before selecting. If the application isn't playing any audio,
nothing would happen.

Running `toggleaudioshare.sh` again would stop sharing audio.

## Scripts

- `shareaudioprompt.sh` - Opens a prompt to select an application to share audio of
- `shareaudio.sh <application_name>` - Starts sharing audio of the `<application_name>`
- `stopshareaudio.sh` - Stops sharing audio

## Credits
The share audio script was taken from a [reddit post here](https://www.reddit.com/r/linux_gaming/comments/hwq6qq/comment/fz3vbxi/?utm_source=share&utm_medium=web2x&context=3)
