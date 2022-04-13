#!/bin/bash
cryptsetup close {{mount_encrypted_drive_device_name}}
cryptsetup luksOpen {{ mount_encrypted_drive_device_location }} {{mount_encrypted_drive_device_name}}
mount /dev/mapper/{{mount_encrypted_drive_device_name}} {{mount_encrypted_drive_mountpoint_path}}
hdparm -B127 -S{{mount_encrypted_drive_script_standby_timeout}} {{ mount_encrypted_drive_device_location }}
