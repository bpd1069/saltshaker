{% from 'xz/map.jinja' import xz_settings with context %}

xz-utils-installed:
  pkg.installed:
    - pkgs: {{ xz_settings.xz_pkgs }}
