essential_packages:
  pkg.installed:
    - pkgs:
      - bash
      - git
      - curl
{% if grains['os'] == 'Ubuntu' %}
      - build-essential
{% endif %}
