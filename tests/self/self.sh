#!/usr/bin/env bash
# vim: set ft=sh :
# shellcheck disable=SC2034

set -o pipefail -eu

source "../../duct"

# duct settings
DUCT_DRY_RUN=false
DUCT_INIT_QUIET=true
DUCT_MSG_LEVEL=7

duct version
