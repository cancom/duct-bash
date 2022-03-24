#!/usr/bin/env bash
# vim: set ft=sh :
# shellcheck disable=SC2034

set -o pipefail -eu

source "../../duct"

# duct settings
DUCT_DRY_RUN=false
DUCT_INIT_QUIET=true
DUCT_MSG_LEVEL=7

duct python check

DUCT_PYTHON_VENV_DEACTIVATE=true
duct python venv # create

DUCT_PYTHON_VENV_DEACTIVATE=false
duct python venv # upgrade

duct run python --version

duct clean "$DUCT_PYTHON_VENV"
