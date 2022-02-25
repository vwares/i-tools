#!/bin/bash
export ANSIBLE_CONFIG_ABSOLUTEPATH=`readlink -f ../../Configuration\ Files/hosts/mcp/filesystem/etc/ansible`
export ANSIBLE_CONFIG="$ANSIBLE_CONFIG_ABSOLUTEPATH/ansible.cfg"
ansible-playbook test.yml -v --private-key ../../Configuration\ Files/hosts/mcp/.ssh/id_rsa --inventory "$ANSIBLE_CONFIG_ABSOLUTEPATH/hosts"
