{% from "wicd/map.jinja" import wicd with context %}

wicd-installed:
  pkg.installed:
    - pkgs: {{ wicd.pkgs }}

start-wicd-service:
  service.running:
    - name: wicd
    - enable: true
    - reload: true

{% if grains['os_family'] == 'Debian' %}
stop-network-manager-service:
  service.dead:
    - name: NetworkManager
    - enable: false
{% endif %}

