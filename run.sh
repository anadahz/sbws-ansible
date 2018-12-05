#!/bin/sh
set -e

# install sbws role
#ansible-playbook -i inventory/hosts setup.yml

ansible-playbook --vault-id @prompt -i inventory/hosts setup.yml
