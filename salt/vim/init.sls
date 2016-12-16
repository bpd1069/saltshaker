{% from "vim/map.jinja" import vim with context %}

vim-installed:
  pkg.installed:
    - name: {{ vim.pkg }}

nvim-installed:
{% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - ppa: neovim-ppa/unstable
  pkg.latest:
    - name: {{ vim.nvim_pkg }}
    - refresh: True
{% else %}
  pkg.installed:
    - name: {{ vim.nvim_pkg }}
{% endif %}

neovim-python3-installed:
  pip.installed:
    - name: neovim
    - bin_env: '/usr/bin/pip3'

neovim-python-installed:
  pip.installed:
    - name: neovim

include:
  - vim.editor
