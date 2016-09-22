#!/usr/bin/env bash

# Forcibly overwrite whatever Salt currently has in /srv/* and place this
# repository's contents there. Will require root.

main() {
  # Empty out the /srv/ dir of salt stuff if present
  rm -rf /srv/salt /srv/pillar

  # Move everything over
  DIR=$(dirname $BASH_SOURCE)
  cp -rf $DIR/* /srv/

  # Try to sync the highstate
  salt-call state.highstate --local
}

main
