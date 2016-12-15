{% from "vim/map.jinja" import vim with context %}

vim-installed:
  pkg.installed:
    - name: {{ vim.pkg }}

include:
  - vim.editor
  - vim.plugins
