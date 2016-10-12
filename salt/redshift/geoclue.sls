geoclue-installed:
  pkg.installed:
    {% if grains['os_family'] == 'Debian' %}
    - name: geoclue-2.0
    {% elif grains['os'] == 'Arch' %}
    - name: geoclue2
    {% endif %}



{% if grains['os_family'] == 'Debian' %}
geoclue-hostip-installed:
  pkg.installed:
    - name: geoclue-hostip
{% endif %}
