#!/usr/bin/env bash

# This script does low level networking checks to ensure we can actually
# download things.

NETWORKING_DIR="$(dirname $BASH_SOURCE)"
source $NETWORKING_DIR/utils.sh

find_default_gateway() {
  return "$(ip r | grep default | awk -F ' ' '{print $3}')"
}

ping_test() {
  ping -q -w 1 -c 1 "$1" > /dev/null 2>&1
}

ping_default_gateway_test() {
  gateway="$(find_default_gateway)"
  ping_test $gateway
}

ping_internet_test() {
  ping_test http://google.com
}

wget_internet_test() {
  gateway="$(find_default_gateway)"
  wget -q --tries=10 --timeout=10 --spider http://google.com
}

require_connected_to_internet() {
  if command_exists ping ; then
    ping_internet_test
    connected=$?
  elif command_exists wget ; then
    wget_internet_test
    connected=$?
  else
    connected=false
  fi

  if [ ! $connected ]; then
    if command_exists ping ; then
      ping_default_gateway_test
      gateway_connected=$?
    else
      gateway_connected=false
    fi
    if [ $gateway_connected ]; then
      printf "You are connected to your default gateway, but not the internet.\n"
      exit 1
    else
      printf "You are not even connected to a default gateway as far as we can tell.\n"
      exit 1
    fi
  fi
  return 0
}
