{% from "gnutls/map.jinja" import gnutls_settings with context %}

gnutls-installed:
  pkg.installed:
    - pkgs: {{ gnutls_settings.pkgs }}
