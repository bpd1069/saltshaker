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

include:
  - vim.editor
