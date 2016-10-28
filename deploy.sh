#!/usr/bin/env bash

# Forcibly overwrite whatever Salt currently has in /srv/* and place this
# repository's contents there. Will require root.

# Sets a couple defaults for the state syncing, but passes along all arguments
# to the script as argument to the salt-call state.highstate call. You can
# actually just override --state_verbose=true if you want to see more.

command_exists() {
  command -v "$1" > /dev/null 2>&1
}

require_running_as_root() {
  if [ "$(id -u)" != "0" ]; then
    printf "This deploy.sh script must be run as root.\n" 1>&2
    exit 1
  fi
}

find_default_gateway() {
  gateway_line="$(ip r | head -n 1)"
  awk -F/n '{print $3}' $gateway_line
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

identify_linux_distribution() {
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
    sh tmp/bootstrap_salt.sh -D -X -F -q
    rm tmp/bootstrap_salt.sh
  fi
}

apply_salt_highstate() {
  salt-call state.apply --state_verbose=false --local $@
}

override_local_salt_files() {
  DIR=$(dirname $BASH_SOURCE)
  rsync -av $DIR/salt/ /srv/salt > /dev/null 2>&1
  rsync -av $DIR/pillar/ /srv/pillar > /dev/null 2>&1
}

# Only to be run AFTER salt applies the highstate, as it expects my user's
# presence on the system.
ljk_password_check() {
  if command_exists passwd ; then
    password_status="$(passwd -S ljk | grep -o NP)"
  else
    printf "You need to set a password for the ljk user, but `passwd` does not exist.\n"
    exit 1
  fi

  if [ ! -z $password_status ]; then
    printf "\n\n\n"
    printf "##############################################################\n"
    printf "            No password is set for the ljk user!\n"
    printf "\n"
    sudo -u ljk passwd ljk
    if [ $? -ne 0 ]; then
      exit 1
    fi
    printf "\n\n"
    printf "            The new password was successfully set.\n"
    printf "##############################################################\n"
  fi
}


# Prerequisites that cannot be fixed and exit script if unmet
require_running_as_root
require_connected_to_internet

# Bootstrapping work to get ready if needed. After these get run once, they
# should never do anything ever again on the system.
ensure_salt_is_installed

# Do the work that actually reoccurs every time we are deployed
override_local_salt_files
apply_salt_highstate $@

# Check that things must be done by hand are completed now, after running all
# that automated stuff
ljk_password_check
