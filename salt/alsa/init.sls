alsa-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - name: alsa-base
{% elif grains['os'] == 'Arch' %}
    - name: alsa-plugins
{% endif %}

alsa-utils-installed:
  pkg.installed:
    - name: alsa-utils
