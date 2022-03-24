#!/usr/bin/env bash
# vim: set ft=sh :
# shellcheck disable=SC2034

set -o pipefail -eu

source "../../duct"

# duct settings
DUCT_INIT_QUIET=true
DUCT_MSG_LEVEL=7
DUCT_DRY_RUN=false

DUCT_TF_BACKEND_TYPE="local"
DUCT_TF_BACKEND_CONFIG=(
  path="${DUCT_TMP_DIR}/terraform.tfstate"
)

DUCT_TF_CLEAN_FILES=(
  "${DUCT_TMP_DIR}/terraform.tfstate"
  "${DUCT_TMP_DIR}/terraform.tfstate.backup"
  .terraform.lock.hcl
  terraform-apply.json
  terraform-backend.tf
  terraform-destroy.json
  terraform-plan.json
  terraform-plan.zip
  terraform.out
)

duct terraform check

duct terraform fmt
duct terraform validate

duct terraform plan
duct terraform plan-json

duct terraform apply
duct terraform apply-json

duct terraform apply-no-plan
duct terraform apply-json

duct terraform destroy
duct terraform destroy-json

duct terraform clean
