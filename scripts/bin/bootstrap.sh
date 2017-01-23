#!/usr/bin/env bash

BOOTSTRAP_DIR="$(cd $(dirname ${BASH_SOURCE[0]} ) && pwd)"
source "$BOOTSTRAP_DIR/../lib/utils.sh"
source "$BOOTSTRAP_DIR/../lib/networking.sh"

setup_err_handling

# Needed for downloading salt's own bootstrapping script
ensure_curl_is_installed() {
  if ! command_exists curl ; then
    printf "curl is not installed... Attempting installation... "
    download_package "curl"
    printf "Complete.\n"
  fi
}

# Needed for the syncing of the salt files into the /srv/salt, /srv/pillar, ...
# directories in the apply.sh script.
ensure_rsync_is_installed() {
  if ! command_exists rsync ; then
    printf "rsync is not installed... Attempting installation... "
    download_package "rsync"
    printf "Complete.\n"
  fi
}

ensure_salt_is_installed() {
  if ! command_exists salt ; then
    ensure_curl_is_installed

    printf "salt is not installed... Attempting installation... \n"
    # This will leave a 'tmp/bootstrap-salt.log' file you can look at
    curl -L https://bootstrap.saltstack.com -o /tmp/bootstrap_salt.sh
    sh /tmp/bootstrap_salt.sh -D -X -F -q
    rm /tmp/bootstrap_salt.sh
    printf "Complete.\n"
  fi
}

# This is what is actually called in the deploy scripts
bootstrap_system() {
  require_connected_to_internet
  ensure_rsync_is_installed
  ensure_salt_is_installed
}


#require_running_as_root
printf "Bootstrapping system up to state where salt can run... "
#bootstrap_system
printf "Complete.\n"
