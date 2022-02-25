#!/bin/bash

if test "$1" = ""
  then echo Source ? ex : /dev/sda
else
  cryptsetup close {{cloud_nas_devicename}}
  cryptsetup luksOpen "$1"1 {{cloud_nas_devicename}}
  mount /dev/mapper/{{cloud_nas_devicename}} {{cloud_nas_mountpoint}}
  hdparm -B127 -S240 $1
fi
