#!/usr/bin/env bash

DEPLOY_DIR="$(cd $( dirname ${BASH_SOURCE[0]} )  && pwd )"
BIN_DIR="$DEPLOY_DIR/scripts/bin/"
source $DEPLOY_DIR/scripts/lib/utils.sh

# Set things up
usage() {
  cat << EOF
USAGE: deploy.sh [OPTIONS]

Requires root.

Use the options to specify which of 3 steps to perform.
By default all 3 occur but if any are provided only the provided steps are run:

  1. Before salt is run the system is bootstrapped up to having salt ready.
  2. Apply the salt highstate to the local machine - takes a long while time.
  3. After salt successfully is applied, some manual configuration is required.

OPTIONS:
  -h      print this help message
  -b      attempt the pre-salt bootstrap step
  -s      attempt the salt step
  -m      attempt the post-salt manual config step
EOF
}

bootstrap_step=false
salt_step=false
manual_step=false
while getopts ":hbsm" opt; do
  case "${opt}" in
    h)
      usage
      exit 0
      ;;
    b)
      bootstrap_step=true
      ;;
    s)
      salt_step=true
      ;;
    m)
      manual_step=true
      ;;
    *)
      printf "Unknown option provided!\n\n"
      usage
      exit 1
      ;;
  esac
done

require_running_as_root
setup_err_handling

if $bootstrap_step || $salt_step || $manual_step ; then
  if "$bootstrap_step" ; then
    bash $BIN_DIR/bootstrap.sh
  fi
  if "$salt_step" ; then
    bash $BIN_DIR/apply.sh
  fi
  if "$manual_step" ; then
    bash $BIN_DIR/manual.sh
  fi
else
  bash $BIN_DIR/bootstrap.sh
  bash $BIN_DIR/apply.sh
  bash $BIN_DIR/manual.sh
fi

exit 0
