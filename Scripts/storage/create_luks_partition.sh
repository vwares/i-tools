#!/bin/bash
# Check syntax
if [ -z "$1" ]; then
  echo "Syntax : $0 [partition] [volumename]"
  echo "e.g : $0 /dev/sda1 myVolume"
  exit
fi

apt-get install cryptsetup
cryptsetup --verbose -y --type luks2 luksFormat --verify-passphrase $1
cryptsetup -v luksOpen $1 $2
mke2fs -t ext4 -L $2 /dev/mapper/$2
