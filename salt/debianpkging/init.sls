{% if grains['os_family'] == 'Debian' %}
packging-utils-installed:
  pkg.installed:
    - pkgs:
      - python-software-properties
      - software-properties-common
      - build-essential
{% endif %}
