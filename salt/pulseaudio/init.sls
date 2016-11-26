# vim: ft=yaml

{% if grains['os_family'] == 'Debian' %}
pulseaudio-installed:
  pkg.installed:
    - name: pulseaudio
{% endif %}

{% if grains['os'] == 'Arch' %}
pulseaudio-alsa-installed:
  pkg.installed:
    - name: pulseaudio-alsa
{% endif %}
