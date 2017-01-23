#!/usr/bin/env bash

# Does the work of actually syncing salt locally

APPLY_DIR="$(cd $( dirname ${BASH_SOURCE[0]} ) && pwd )"

override_local_salt_files() {
  rsync -av --delete $APPLY_DIR/../salt/ /srv/salt > /dev/null 2>&1
  rsync -av --delete $APPLY_DIR/../pillar/ /srv/pillar > /dev/null 2>&1
}

apply_salt_highstate() {
  salt-call state.apply --state_verbose=false --local $@
}

override_local_salt_files
apply_salt_highstate
