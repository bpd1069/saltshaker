{% from "xmonad/map.jinja" import xmonad_settings with context %}

xmonad-installed:
  pkg.installed:
    - name: {{ xmonad_settings.xmonad_pkg }}

xmonad-dev-installed:
  pkg.installed:
    - pkgs: {{ xmonad_settings.xmonad_dev_pkg }}
  require:
    - pkg: xmonad-installed

xmonad-extensions-installed:
  pkg.installed:
    - pkgs: {{ xmonad_settings.extensions_pkg }}
  require:
    - pkg: xmonad-installed

include:
 - xmonad.xmobar
