sudoers:
  users:
    root:
      - 'ALL=(ALL) ALL'
    ljk:
      - 'ALL=(ALL) ALL'
  groups:
    sudo:
      - 'ALL=(ALL) ALL'
  defaults:
    generic:
      - env_reset
      - mail_badpass
      - secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      - env_keep+=HOME
      - !always_set_home, !set_home
    user_list:
      ljk: '!requiretty'
      ADMINS: '!lecture'
    host_list:
      www1: 'log_year, logfile=/var/log/sudo.log'
    command_list:
      PROCESSES: 'noexec'
    runas_list:
      root: '!set_logname'
    users:
      ADMINS:
        - ljk
    commands:
      PROCESSES:
        - /usr/bin/nice
        - /bin/kill
        - /usr/bin/renice
        - /usr/bin/pkill
        - /usr/bin/top
