xorg-installed:
  pkg.installed:
    {% if grains['os_family'] == 'Debian' %}
    - pkgs: [ xorg ]
    {% elif grains['os'] == 'Arch' %}
    - pkgs: [ xorg-server ]
    {% endif %}

{% if grains['os_family'] == 'Debian' %}
xorg-dev-installed:
  pkg.installed:
    - pkgs: [ xorg-dev ]
  require:
    - pkgs: [ xorg-installed ]
{% endif %}

{% if grains['os'] == 'Arch' %}
xorg-extensions-installed:
  pkg.installed:
    - pkgs: [ xorg-server-utils ]
  require:
    - pkgs: [ xorg-installed ]
{% endif %}
