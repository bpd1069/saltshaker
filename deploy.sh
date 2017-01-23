#!/usr/bin/env bash

DEPLOY_DIR="$(cd $( dirname ${BASH_SOURCE[0]} )  && pwd )"
source $DEPLOY_DIR/scripts/lib/utils.sh

# Set things up
setup_err_handling
require_running_as_root

# Now run the independent steps to be completed:
#    Get the system into a state where salt can run
bash $DEPLOY_DIR/scripts/bin/bootstrap.sh
#    Apply the salt states to the local machine
bash $DEPLOY_DIR/scripts/bin/apply.sh
#    Force the user to do the post-application, manual,
#    interactive tasks like setting passwords.
bash $DEPLOY_DIR/scripts/bin/manual.sh
