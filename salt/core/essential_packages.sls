essential_packages:
  pkg.installed:
    - pkgs:
      - bash
      - git
      - curl
      - expect
{% if grains['os'] == 'Ubuntu' %}
      - python-software-properties
      - build-essential
{% endif %}
