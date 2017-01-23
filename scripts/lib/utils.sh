#!/usr/bin/env bash

# Miscellaneous bash used all over other scripts

_exit_handler() {
  local err_code="$?"
  test $err_code == 0 && return;

  test -t 1 && tput bold && tput setf 4

  printf "\n(!!!) BAD EXIT HANDLED:\n"
  local script_name="$0"
  printf "ERROR: ${script_name}: at or near line $1 with exit status of ${err_code}\n"

  test -t 1 && tput sgr0
  exit $err_code
}

setup_err_handling() {
  set -o nounset
  set -o pipefail
  set -o errtrace
  set -o errexit

  trap '_exit_handler ${LINENO}' EXIT
  trap exit ERR
}

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

# Download a package with the system manager for early bootstrapping steps.
# Parameters:
#    $@    - names of packages to install
download_package() {
  local distro="$(identify_OS)"
  if [ "$distro" -eq "Arch" ]; then
    pacman --noconfirm $@
  elif [ "$distro" -eq "Ubuntu" ]; then
    apt install -y $@
  else
    printf "\n\nCould not identify your system to download a package.\n"
    exit 1
  fi
}
