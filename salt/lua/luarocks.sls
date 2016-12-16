luarocks-installed:
  cmd.script:
    - source: salt://lua/scripts/luarocks_install.sh
    - runas: root
    - shell: /bin/bash
    - unless: test -x /usr/local/bin/luarocks
