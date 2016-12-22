guile-2-installed:
  pkg.installed:
    - name: guile-2.0

{% if grains['os_family'] == 'Debian' %}
guile-2-dev-installed:
  pkg.installed:
    - name: guile-2.0-dev
{% endif %}
