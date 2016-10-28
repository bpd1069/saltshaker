#!/usr/bin/env bash

# This is the only script here that has any raw statements to execute.
# Everything in the 'scripts' directory is just a library function that
# supplies the primary operations initiated here.

DEPLOY_DIR="$(dirname $BASH_SOURCE)"

source $DEPLOY_DIR/scripts/utils.sh
source $DEPLOY_DIR/scripts/networking.sh
source $DEPLOY_DIR/scripts/bootstrap_arch.sh
source $DEPLOY_DIR/scripts/apply.sh
source $DEPLOY_DIR/scripts/manual.sh

# Prerequisites that cannot be fixed and exit script if unmet
require_running_as_root
require_connected_to_internet

# Automates the first time setup if needed
bootstrap_system

# Does the actual work of syncing the local machine to the salt states
apply_saltshaker

# Check that things that must be done by hand are completed now, after running
# all that automated stuff
ljk_password_check
