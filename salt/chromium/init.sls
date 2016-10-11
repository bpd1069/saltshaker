# vim: ft=yaml

chromium-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - name: 'chromium-browser'
{% else %}
    - name: 'chromium'
{% endif%}

include:
  - chromium.flash
