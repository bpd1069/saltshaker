{% if grains['os_family'] == 'Debian' %}
arduino-environment-installed:
  pkg.installed:
    - name: arduino
{% endif %}
