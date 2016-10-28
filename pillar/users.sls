users:
  ljk:
    fullname: Lucas Kolstad
    enforce_password: True
    home: /home/ljk
    system: false
    user_dir_mode: 750
    createhome: True
    manage_vimrc: False
    manage_bashrc: False
    manage_profile: False
    shell: /bin/bash
    remove_groups: False
    prime_group:
      name: ljk
    groups:
      - adm
      - audio
      - cdrom
      - dialout
      - dip
      - disk
      - docker
      - floppy
      - ftp
      - games
      - http
      - input
      - kvm
      - lock
      - log
      - network
      - optical
      - plugdev
      - sambashare
      - scanner
      - storage
      - sudo
      - sys
      - tty
      - users
      - utmp
      - uucp
      - video
      - wheel

    ssh_key_type: rsa
    ssh_config:
      all:
        hostname: "*"
        options:
          - "StrictHostKeyChecking no"
          - "UserKnownHostsFile=/dev/null"
          - "Protocol 2"
          - "ControlMaster auto"
          - "ControlPath ~/.ssh/control/%r@h:%p"
          - "ControlPersist 1800"
          - "compression yes"
          - "TCPKeepAlive yes"
          - "ServerAliveInterval 20"
          - "ServerAliveCountMax 10"

    gitconfig:
      user.name: lucaskolstad
      user.email: lkolstad@uw.edu
      url."https://".insteadOf: "git://"
