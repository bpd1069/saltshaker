#!/usr/bin/env bash

BOOTSTRAP_DIR="$(dirname $BASH_SOURCE)"
source $BOOTSTRAP_DIR/utils.sh
source $BOOTSTRAP_DIR/networking.sh

ensure_curl_is_installed() {
  if ! command_exists curl ; then
    distro="$(identify_linux_distribution)"

    if [ "$distro" -eq "Arch" ]; then
      pacman -S curl
    elif [ "$distro" -eq "Ubuntu" ]; then
      apt install curl
    else
      printf "Curl is not installed and unable to install it automatically."
      exit 1
    fi
  fi
}

ensure_salt_is_installed() {
  if ! command_exists salt ; then
    ensure_curl_is_installed

    # This will leave a 'tmp/bootstrap-salt.log' file you can lookat
    curl -L https://bootstrap.saltstack.com -o /tmp/bootstrap_salt.sh
    sh /tmp/bootstrap_salt.sh -D -X -F -q
    rm /tmp/bootstrap_salt.sh
  fi
}

ensure_rsync_is_installed() {
  if ! command_exists rsync ; then
    pacman -S rsync --noconfirm
  fi
}

ensure_git_is_installed() {
  if ! command_exists git ; then
    pacman -S git --noconfirm
  fi
}

# This is what is actually called in the deploy scripts
bootstrap_system() {
  require_connected_to_internet
  ensure_rsync_is_installed
  ensure_git_is_installed
  ensure_salt_is_installed
}
