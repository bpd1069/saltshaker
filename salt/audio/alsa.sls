{% if grains['os'] == 'Ubuntu' %}
alsa-base:
  pkg.installed

alsa-utils:
  pkg.installed
{% elif grains['os'] == 'Arch' %}
alsa-utils:
  pkg.installed

alsa-plugins:
  pkg.installed
{% endif %}
