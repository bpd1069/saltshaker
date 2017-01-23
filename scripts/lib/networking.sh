#!/usr/bin/env bash

# This script does low level networking checks to ensure we can actually
# download things.

NETWORKING_DIR="$(cd $(dirname ${BASH_SOURCE[0]} ) && pwd)"
source $NETWORKING_DIR/utils.sh

setup_err_handling

find_default_gateway() {
  return "$(ip r | grep default | awk -F ' ' '{print $3}')"
}

ping_test() {
  if command_exists ping ; then
    if ping -q -w 1 -c 1 "$1" > /dev/null 2>&1 ; then
      return 0
    fi
  fi
  return 1
}

ping_default_gateway_test() {
  gateway="$(find_default_gateway)"
  if ping_test $gateway ; then
    return 0
  fi
  return 1
}

ping_internet_test() {
  if ping_test http://google.com ; then
    return 0
  fi
  return 1
}

wget_internet_test() {
  if command_exists wget ; then
    if wget -q --tries=10 --timeout=10 --spider http://google.com > /dev/null 2>&1 ; then
      return 0
    fi
  fi
  return 1
}

require_connected_to_internet() {
  if [[ ping_internet_test || wget_internet_test ]] ; then
    return 0
  fi
  exit 1
}
