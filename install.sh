#!/bin/bash

# Source: https://gist.github.com/berkayunal/ccb1c3511f02d41b7654de17bced30b7

set -o nounset -o pipefail -o errexit

# Load all variables from .env and export them all for Ansible to read
set -o allexport
source "$(dirname "$0")/.env"
set +o allexport

# if the first argument ends with ".yml", use it as the playbook
if [[ $# -gt 0 && $1 == *.yml ]]; then
  PLAYBOOK=$1
  shift
else
  PLAYBOOK="install.yml"
fi

# Run Ansible
exec ansible-playbook -K "$PLAYBOOK" "$@"