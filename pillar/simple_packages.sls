# These packages are just simple *.install entries with no logic other than to
# be filtered by a specific os or to be applied to a specific install type such
# as pkg.install vs gem.install vs npm.install.

# If a package has any sort of logic or procedure to its installation, for
# example things like else statements such as 'if debian this else that', are
# not dealt with here and are instead moved over to the salt state template
# files.

# Always installed
simple_generic_packages:
  - alex
  - alsa-utils
  - atop
  - avr-libc
  - avrdude
  - bash
  - bc
  - cabal-install
  - clamav
  - clang
  - cmus
  - curl
  - ddd
  - dia
  - doxygen
  - emacs
  - expect
  - ffmpeg
  - gdb
  - ghc
  - git
  - golang
  - guile-2.0
  - happy
  - htop
  - imagemagick
  - inkscape
  - inotify-tools
  - iw
  - jq
  - julia
  - llvm
  - lua50
  - luajit
  - mutt
  - nasm
  - nmap
  - nodejs
  - npm
  - parted
  - perl
  - postgresql
  - racket
  - ruby
  - rxvt-unicode
  - sbcl
  - sqlite
  - swig
  - tar
  - tree
  - unrar
  - vagrant
  - virtualbox
  - w3m
  - wget

# Only on Arch systems
simple_arch_packages:
  - alsa-plugins
  - avr-binutils
  - avr-gcc
  - avr-gdb
  - go
  - pacaur
  - pulseaudio-alsa
  - virtualbox-host-modules-arch
  - wpa_supplicant
  - xz

# Only on Debian systems
simple_debian_packages:
  - alsa-base
  - arduino
  - avra
  - binutils-avr
  - build-essential
  - gcc-avr
  - gdb-avr
  - guile-2.0-dev
  - libncurses5-dev
  - ncurses-bin
  - ninja-build
  - perl-doc
  - postgresql-client
  - postgresql-contrib
  - pulseaudio
  - python-software-properties
  - software-properties-common
  - xz-utils
  - xzdec

simple_cabal_packages:
  - pandoc

simple_gem_packages:
  - bundler
  - sass

simple_npm_packages:
  - tslint

simple_cargo_packages:
  - racer
  - ripgrep
  - rustfmt
