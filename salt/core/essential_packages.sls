essential-packages:
  pkg.installed:
    - pkgs:
      - bash
      - curl
      - wget
      - expect
{% if grains['os_family'] == 'Debian' %}
      - python-software-properties
      - software-properties-common
      - build-essential
{% endif %}
