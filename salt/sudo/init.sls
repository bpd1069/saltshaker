{% if grains['os'] == 'Arch' %}
sudo-installed:
  pkg.installed:
    - name: sudo
{% endif %}
