#!/usr/bin/env bash

# Does the work of actually syncing salt locally

APPLY_DIR="$(cd $( dirname ${BASH_SOURCE[0]} ) && pwd )"

source "$APPLY_DIR/../lib/utils.sh"
setup_err_handling

override_local_salt_files() {
  _exit_if_fails rsync -av --delete $APPLY_DIR/../../salt/ /srv/salt > /dev/null 2>&1
  _exit_if_fails rsync -av --delete $APPLY_DIR/../../pillar/ /srv/pillar > /dev/null 2>&1
}

apply_salt_highstate() {
  _exit_if_fails salt-call state.apply --state_verbose=false --local $@
}

require_running_as_root
printf "Overriding the local salt files... "
override_local_salt_files
printf "Complete.\n"
printf "Applying the salt highstate...\n"
apply_salt_highstate
printf "Complete.\n"
