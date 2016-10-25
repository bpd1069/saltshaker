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

check_if_root
override_local_salt_files
apply_salt_highstate $@
