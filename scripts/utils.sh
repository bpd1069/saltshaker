#!/usr/bin/env bash

# Miscellaneous bash functions used all over other scripts

command_exists() {
  command -v "$1" > /dev/null 2>&1
}

require_running_as_root() {
  if [ "$(id -u)" != "0" ]; then
    printf "This deploy.sh script must be run as root.\n" 1>&2
    exit 1
  fi
}

identify_OS() {
  if [ -e /etc/arch-release ]; then
    return "Arch"
  fi

  if command_exists lsb_release ; then
    distro="$(lsb_release -i)"
    if [[ $distro =~ Ubuntu$ ]]; then
      return "Ubuntu"
    fi
  fi

  printf "Could not identify your OS distribution!\n"
  exit 1
}
