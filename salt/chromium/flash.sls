# vim: ft=yaml

flash-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - name: 'adobe-flashplugin'
{% else %}
    - name: 'pepper-flash'
{% endif%}

