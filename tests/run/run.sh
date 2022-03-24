#!/usr/bin/env bash
# vim: set ft=sh :
# shellcheck disable=SC2034

set -o pipefail -eu

source "../../duct"

# duct settings
DUCT_INIT_QUIET=true
DUCT_MSG_LEVEL=7
DUCT_DRY_RUN=false

DUCT_RUN_HOOKS["run0"]="./hook"
DUCT_RUN_HOOKS["run1"]="./hook"

PATH=".:$PATH"

duct run run0
duct run run1 --with-extra
