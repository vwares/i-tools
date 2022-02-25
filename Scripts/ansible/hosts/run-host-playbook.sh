#!/bin/bash

# Check syntax
if [ -z "$1" ]; then
  echo "Syntax : $0 [hostname]"
  exit
fi

# Set host name
export IAC_HOSTNAME="$1" # e.g "gaia"

# Set absolute path and hostname
export IAC_DIRECTORY=`readlink -f ../../..`

# Set Ansible environnement vars
export ANSIBLE_CONFIG="$IAC_DIRECTORY/Configuration Files/hosts/mcp/filesystem/etc/ansible/ansible.cfg"
export ANSIBLE_PRIVATE_KEY_FILE="$IAC_DIRECTORY/Configuration Files/hosts/mcp/filesystem/home/iac/.ssh/id_rsa"

# Set other vars
export IAC_COLLECTIONS_PATH="$IAC_DIRECTORY/Source code/ansible/collections"
export IAC_HOSTSFILE="$IAC_DIRECTORY/Configuration Files/hosts/mcp/filesystem/etc/ansible/hosts"
export JSON_HOSTSETTINGS="$IAC_DIRECTORY/Configuration Files/hosts/$IAC_HOSTNAME/ansible/host_settings.json"

# Run playbook
ansible-playbook $IAC_HOSTNAME.yml -v --inventory "$IAC_HOSTSFILE" --extra-vars \
  "json_host_settings='${JSON_HOSTSETTINGS}' \
   collections_path='${IAC_COLLECTIONS_PATH}' \
   iac_base_dir='${IAC_DIRECTORY}' \
  "
