geoclue2-installed:
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
    - requires:
      pkg: geoclue2-installed
{% endif %}

geoclue-configured:
  file.managed:
    - name: /etc/geoclue/geoclue.conf
    - source: salt://geoclue/files/geoclue.conf 
