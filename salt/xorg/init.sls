{% from "xorg/map.jinja" import xorg_settings with context %}

xorg-installed:
  pkg.installed:
    - pkgs: {{ xorg_settings.xorg_pkg }}

xorg-fonts-installed:
  pkg.installed:
    - pkgs: {{ xorg_settings.xorg_fonts_pkg }}
  require:
    - pkgs: [ xorg-installed ]


xorg-dev-installed:
  pkg.installed:
    - pkgs: {{ xorg_settings.xorg_dev_pkg }}
  require:
    - pkgs: [ xorg-installed ]

xorg-extensions-installed:
  pkg.installed:
    - pkgs: {{ xorg_settings.xorg_extensions_pkgs }}
  require:
    - pkgs: [ xorg-installed ]
