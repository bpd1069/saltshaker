{% if grains['os_family'] == 'Debian' %}
include:
  - vim

editor:
  alternatives.install:
    - link: /usr/bin/editor
    - path: /usr/bin/vim
    - priority: 100
    - require:
       - vim-installed
{% endif %}
