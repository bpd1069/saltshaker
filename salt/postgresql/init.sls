postgresql-server-installed:
  pkg.installed:
    - name: postgresql

{% if grains['os_family'] == 'Debian' %}
postgresql-client-installed:
  pkg.installed:
    - name: postgresql-client

postgresql-contrib-installed:
  pkg.installed:
    - name: postgresql-contrib
{% endif %}
