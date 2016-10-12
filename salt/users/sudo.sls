# vim: sts=2 ts=2 sw=2 et ai
{% from "users/map.jinja" import users with context %}

# Ensure availability of bash
users_bash-package:
  pkg.installed:
    - name: {{ users.bash_package }}

users_sudo-package:
  pkg.installed:
    - name: {{ users.sudo_package }}
    - require:
      - file: {{ users.sudoers_dir }} 

users_{{ users.sudoers_dir }}:
  file.directory:
    - name: {{ users.sudoers_dir }}

users_sudoer-defaults:
    file.append:
        - name: {{ users.sudoers_file }} 
        - require:
          - pkg: users_sudo-package
        - text:
          - Defaults   env_reset
          - Defaults   env_keep+=HOME
          - Defaults   secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
          - Defaults   !always_set_home, !set_home
          - '#includedir {{ users.sudoers_dir }}'
