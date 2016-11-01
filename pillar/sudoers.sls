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
  includedir: /etc/sudoers.d
