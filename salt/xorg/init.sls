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


xorg-dev-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - pkgs: [ xorg-dev ]
{% endif %}
    - pkgs: []
  require:
    - pkgs: [ xorg-installed ]

xorg-extensions-installed:
  pkg.installed:
{% if grains['os'] == 'Arch' %}
    - pkgs: [ xorg-server-utils ]
{% endif %}
    - pkgs: []
  require:
    - pkgs: [ xorg-installed ]

xorg-xinit-installed:
  pkg.installed:
{% if grains['os'] == 'Arch' %}
    - pkgs: [ xorg-xinit ]
{% endif %}
    - pkgs: []
  require:
    - pkgs: [ xorg-installed ]
