#!/usr/bin/env bash
# vim: set ft=sh :
# shellcheck disable=SC2034

set -o pipefail -eu

source "../../duct"

# duct settings
DUCT_DRY_RUN=false
DUCT_INIT_QUIET=true
DUCT_MSG_LEVEL=7

DUCT_GIT_USER_NAME="duct"
DUCT_GIT_USER_EMAIL="duct@localhost"
DUCT_GIT_USER_TOKEN="ZHVjdC10ZXN0LWZyYW1ld29yay1vbmx5IQ=="

duct git config
duct git auth

duct git clone https://github.com/ducthq/duct-bash.git "P:${PWD}/tmp"
duct git clone https://github.com/ducthq/duct-bash.git "P:${PWD}/tmp"

duct clean "${PWD}/tmp"
