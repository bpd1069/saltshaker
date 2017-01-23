#!/usr/bin/env bash

# This script contains all the functions which must be run and handled manually
# after the salt highstate has been applied. These prompt for all the stuff you
# must do manually, such as setting passwords.

MANUAL_DIR="$(cd $(dirname ${BASH_SOURCE[0]} ) && pwd)"
source "$MANUAL_DIR/../lib/utils.sh"

setup_err_handling

ljk_password_check() {
  if command_exists passwd ; then
    if [ ! -z "$(passwd -S ljk | grep -o NP)" ]; then
      printf "\n\n\n##############################################################\n"
      printf "            No password is set for the ljk user!\n\n"
      passwd ljk
      if [ $? -ne 0 ]; then
        exit 1
      fi
      printf "\n\n            The new password was successfully set.\n"
      printf "##############################################################\n"
    else
      printf "Checking whether passwords need to be manually configured... Complete.\n"
    fi
  else
    printf "\nYou need to set a password for the ljk user, but the `passwd` program does not exist.\n"
    exit 1
  fi
}

require_running_as_root
ljk_password_check
