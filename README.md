# Discord Audio Share on Linux

A simple utility allowing you to share audio when using discord on linux. This
works by routing your application audio and your mic input into a single audio
source, which is then used by discord as the input device.

**NOTE:** This only works on the Discord Client.

## Installation

### Prerequisites

- Pulseaudio is required
- This utility uses [Rofi](https://github.com/davatorium/rofi) to create a prompt
to select an application. Follow the [installation instructions](https://github.com/davatorium/rofi/blob/next/INSTALL.md#install-distribution)
to install rofi.


### Installing `discordaudioshare`

Clone this repository to any directory you like

```bash
git clone https://github.com/aneeshsharma/DiscordAudioShare-Linux
```

To install, run `install.sh`

```bash
cd DiscordAudioShare-Linux
chmod +x install.sh
./install.sh
```

The install script will ask for sudo password.

Run `discordaudioshare` to launch a rofi prompt asking you to select the application
to share audio of.

Now, you can add a hotkey/shortcut using any hotkey utility to `discordaudioshare`.
For example, in `sxhkd`, you can add the following

```
# Discord Audio Share
super + a
    discordaudioshare
```

## Uninstall

To uninstall `discordaudioshare`, clone this repository and run `uninstall.sh`

```bash
git clone https://github.com/aneeshsharma/DiscordAudioShare-Linux
cd DiscordAudioShare-Linux
chmod +x uninstall.sh
./uninstall.sh
```

## Usage

When running `discordaudioshare`, a prompt shows up asking you to select an application.
You can select the application you want to share audio of from there.
- **Make sure the application is playing audio before selecting**. If the application isn't
  playing any audio, nothing would happen.
- **You should be in a discord call** before using this

Running `discordaudioshare` again would stop sharing audio.

## Scripts

- `shareaudioprompt.sh` - Opens a prompt to select an application to share audio of
- `shareaudio.sh <application_name>` - Starts sharing audio of the `<application_name>`
- `stopshareaudio.sh` - Stops sharing audio

## Credits
Special thanks to [@hotmonkeywings](https://github.com/hotmonkeywings) for writing the share audio script.

The share audio script was referenced and altered from a [reddit post here](https://www.reddit.com/r/linux_gaming/comments/hwq6qq/comment/fz3vbxi/?utm_source=share&utm_medium=web2x&context=3)
