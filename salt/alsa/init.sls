{% if grains['os'] == 'Ubuntu' %}
alsa-base:
  pkg.installed
{% endif %}

{% if grains['os'] == 'Arch' %}
alsa-plugins:
  pkg.installed
{% endif %}

alsa-utils:
  pkg.installed
