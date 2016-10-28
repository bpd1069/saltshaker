essential_packages:
  pkg.installed:
    - pkgs:
      - bash
      - curl
      - expect
{% if grains['os'] == 'Ubuntu' %}
      - python-software-properties
      - software-properties-common
      - build-essential
{% endif %}
