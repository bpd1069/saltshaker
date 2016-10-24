essential_packages:
  pkg.installed:
    - pkgs:
      - bash
      - curl
      - expect
{% if grains['os'] == 'Ubuntu' %}
      - python-software-properties
      - build-essential
{% endif %}
