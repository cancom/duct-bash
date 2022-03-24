#!/usr/bin/env bash
# vim: set ft=sh :
# shellcheck disable=SC2034

set -o pipefail -eu

source "../../duct"

# duct settings
DUCT_DRY_RUN=false
DUCT_INIT_QUIET=true
DUCT_MSG_LEVEL=7

DUCT_ANSIBLE_VAULT_PASSWORD="ZHVjdC10ZXN0cy1vbmx5IQ=="
DUCT_ANSIBLE_VAULT_PASSWORD_FILE=".ansible-vault"

DUCT_ANSIBLE_CLEAN_DIRS=(
  collections
  fact
  roles
  "$DUCT_PYTHON_VENV"
)
DUCT_ANSIBLE_CLEAN_FILES=(
  .ansible-vault
  log/ansible.log
)

duct python check
duct python venv
duct python pip requirements.txt

duct ansible venv
duct ansible check
duct ansible vault
duct ansible requirements
duct ansible playbook main.yml
duct ansible clean
