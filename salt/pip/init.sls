{% from "pip/map.jinja" import pip with context %}

pip:
  pkg.installed:
    - pkgs: {{ pip.pip_pkg }}
