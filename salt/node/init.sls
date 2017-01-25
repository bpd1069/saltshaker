nodejs-to-node-rename:
  cmd.run:
    - name: ln -s /usr/bin/nodejs /usr/local/bin/node
    - creates: /usr/local/bin/node
    - runas: root


npm_packages_installed:
  npm.installed:
    - names: {{ pillar['simple_npm_packages'] }}
