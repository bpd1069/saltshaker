users:
  luke:
    fullname: Lucas Kolstad
    password: LUKE_PASSWORD
    enforce_password: True
    home: /home/luke
    system: false
    user_dir_mode: 750
    createhome: True
    manage_vimrc: False
    manage_bashrc: False
    manage_profile: False
    sudouser: True
    sudo_defaults:
      - '!requiretty'
    shell: /bin/bash
    remove_groups: False
    prime_group:
      name: luke
    groups:
      - users

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
      user.email: lkolstad@uw.com
      url."https://".insteadOf: "git://"

  guest:
    fullname: Wonderful Friend
    empty_password: True
    home: /home/guest
    system: false
    user_dir_mode: 750
    manage_vimrc: True
    manage_bashrc: True
    manage_profile: True
    sudouser: False
    shell: /bin/bash
    remove_groups: False
    prime_group:
      name: guest
    groups:
      - users
