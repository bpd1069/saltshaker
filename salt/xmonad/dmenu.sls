{% from "xmonad/map.jinja" import xmonad_settings with context %}

dmenu-installed:
  pkg.installed:
    - pkgs: {{ xmonad_settings.dmenu_pkg }}
