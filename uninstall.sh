#!/bin/sh

# Location to store all files relevant to this application
installation_dir=/usr/share/discordaudioshare
# Location where user "bin" packages are installed
bin_dir=/usr/bin

sudo rm -r $installation_dir
sudo rm $bin_dir/discordaudioshare
