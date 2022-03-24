#!/usr/bin/env bash
# vim: set ft=sh :

set -o pipefail -eu

shopt -s globstar

for TEST in **
do
  if [[ "$TEST" =~ .sh$ ]] && [[ "$TEST" != "${0##*/}" ]]
  then
    if [[ -x "$TEST" ]]
    then
      (
        echo ":: ${TEST%%/*}"
        PATH=".:${PATH}"
        cd "${TEST%%/*}" || exit
        "${TEST##*/}"
      )
    fi
  fi
done

shopt -u globstar
