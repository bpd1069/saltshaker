xorg-installed:
  pkg.installed:
    {% if grains['os_family'] == 'Debian' %}
    - pkgs: [ xorg ]
    {% elif grains['os'] == 'Arch' %}
    - pkgs: [ xorg-server ]
    {% endif %}

xorg-fonts-installed:
  pkg.installed:
    {% if grains['os_family'] == 'Debian' %}
    - pkgs: [ xfonts-100dpi ]
    {% elif grains['os'] == 'Arch' %}
    - pkgs: [ xorg-fonts-100dpi ]
    {% else %}
    - pkgs: []
    {% endif %}
  require:
    - pkgs: [ xorg-installed ]


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

xorg-xinit-installed:
  pkg.installed:
    - pkgs: [ xorg-xinit ]
  require:
    - pkgs: [ xorg-installed ]
{% endif %}
