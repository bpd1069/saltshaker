{% from "nvim/map.jinja" import nvim with context %}

{% if grains['os_family'] == 'Debian' %}
neovim-installed:
  pkgrepo.managed:
    - ppa: neovim-ppa/unstable
  pkg.latest:
    - name: neovim
    - refresh: True
{% else %}
neovim-installed:
  pkg.installed:
    - name: {{ nvim.pkg }}
{% endif %}

neovim-python-installed:
  pip.installed:
    - name: neovim

include:
  - nvim.plugins
