essential_packages:
  pkg.installed:
    - pkgs:
      - bash
      - git
      - curl
{% if grains['os'] == 'Ubuntu' %}
      - python-software-properties
      - build-essential
{% endif %}
