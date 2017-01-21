node-installed:
  pkg.installed:
    - name: nodejs

npm:
  pkg.installed

nodejs-to-node-rename:
  cmd.run:
    - name: ln -s /usr/bin/nodejs /usr/local/bin/node
    - creates: /usr/local/bin/node
    - runas: root

{% for pkg_name in pillar.get('npm', {}) %}
npm-package-{{ pkg_name }}-installed:
  npm.installed:
    - name: {{ pkg_name }}
    - require:
      - pkg: npm
{% endfor %}
