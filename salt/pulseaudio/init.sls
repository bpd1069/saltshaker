# vim: ft=yaml

{% if grains['os'] == 'Ubuntu' %}
pulseaudio:
  pkg.installed: []
{% endif %}

{% if grains['os'] == 'Arch' %}
pulseaudio-alsa:
  pkg.installed: []
{% endif %}
