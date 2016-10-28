#!/usr/bin/env bash

# Forcibly overwrite whatever Salt currently has in /srv/* and place this
# repository's contents there. Will require root.

# Sets a couple defaults for the state syncing, but passes along all arguments
# to the script as argument to the salt-call state.highstate call. You can
# actually just override --state_verbose=true if you want to see more.

apply_salt_highstate() {
  salt-call state.apply --state_verbose=false --local $@
}

override_local_salt_files() {
  # Empty out the /srv/ dir of salt stuff if present
  rm -rf /srv/salt /srv/pillar

  # Move everything over
  DIR=$(dirname $BASH_SOURCE)
  cp -rf $DIR/pillar /srv/
  cp -rf $DIR/salt /srv/
}

check_if_root() {
  if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root." 1>&2
    exit 1
  fi
}

# Only to be run AFTER salt applies the highstate, as it expects my user's
# presence on the system.
ljk_password_check() {
  password_status="$(passwd -S ljk | grep -o NP)"

  # if no password is set
  if [ ! -z $password_status ]; then
    printf "\n\n\n"
    printf "##############################################################\n"
    printf "            No password is set for the ljk user!\n"
    printf "\n"
    sudo -u ljk passwd ljk
    if [ $? -ne 0 ]; then
      exit 1
    fi
    printf "\n\n"
    printf "            The new password was successfully set.\n"
    printf "##############################################################\n"
  fi
}

check_if_root
override_local_salt_files
apply_salt_highstate $@

# Check that things must be done by hand are completed now, after running salt
ljk_password_check
