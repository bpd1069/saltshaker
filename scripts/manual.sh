#!/usr/bin/env bash

# This script contains all the functions which must be run after the salt
# highstate has been applied. These prompt for all the stuff you must do
# manually, such as setting passwords.

MANUAL_DIR="$(dirname $BASH_SOURCE)"
source $MANUAL_DIR/utils.sh

ljk_password_check() {
  require_running_as_root

  if command_exists passwd ; then
    password_status="$(passwd -S ljk | grep -o NP)"
  else
    printf "You need to set a password for the ljk user, but `passwd` does not exist.\n"
    exit 1
  fi

  if [ ! -z $password_status ]; then
    printf "\n\n\n"
    printf "##############################################################\n"
    printf "            No password is set for the ljk user!\n"
    printf "\n"
    passwd ljk
    if [ $? -ne 0 ]; then
      exit 1
    fi
    printf "\n\n"
    printf "            The new password was successfully set.\n"
    printf "##############################################################\n"
  fi
}
