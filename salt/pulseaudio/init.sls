# vim: ft=yaml

{% if grains['os_family'] == 'Debian' %}
pulseaudio:
  pkg.installed: []
{% endif %}

{% if grains['os'] == 'Arch' %}
pulseaudio-alsa:
  pkg.installed: []
{% endif %}
