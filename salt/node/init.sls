node-installed:
  pkg.installed:
    - name: nodejs

nodejs-to-node-rename:
  cmd.run:
    - name: ln -s /usr/bin/nodejs /usr/local/bin/node
    - creates: /usr/local/bin/node
    - runas: root
