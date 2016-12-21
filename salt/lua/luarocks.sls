include:
  - lua

luarocks-installed:
  cmd.script:
    - source: salt://lua/scripts/luarocks_install.sh
    - runas: root
    - shell: /bin/bash
    - unless: test -x /usr/local/bin/luarocks

luaposix-installed:
  cmd.run:
    - name: luarocks install luaposix
    - runas: root
    - unless: luajit -e "local posix = require 'posix.unistd'"
    - requires:
      - luarocks-installed
      - luajit-installed
