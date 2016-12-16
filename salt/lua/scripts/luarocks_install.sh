#!/usr/bin/env bash

download_latest() {
  git clone https://github.com/luarocks/luarocks "$1"
}

build_and_install() {
  cd "$1"
  bash ./configure
  make build
  make install
  cd - > /dev/null
}

cleanup_source() {
  rm -r "$1"
}

main() {
  dir_name="luarocks"
  download_latest $dir_name
  build_and_install $dir_name
  cleanup_source $dir_name
}

main
