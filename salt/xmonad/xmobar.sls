{% from "xmonad/map.jinja" import xmonad_settings with context %}

include:
  - xmonad

xmobar-installed:
  pkg.installed:
    - name: {{ xmonad_settings.xmobar_pkg }}
  require:
    - pkg: xmonad-dev-installed
