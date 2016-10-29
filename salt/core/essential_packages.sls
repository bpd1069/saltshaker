essential_packages:
  pkg.installed:
    - pkgs:
      - bash
      - curl
      - expect
{% if grains['os_family'] == 'Debian' %}
      - python-software-properties
      - software-properties-common
      - build-essential
{% endif %}
