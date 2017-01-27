simple-generic-packages-installed:
  pkg.latest:
    - names: {{ pillar['simple_generic_packages'] }}

simple-os-specific-packages-installed:
  pkg.latest:
{% if grains['os_family'] == 'Arch' %}
    - names: {{ pillar['simple_arch_packages'] }}
{% elif grains['os_family'] == 'Debian' %}
    - names: {{ pillar['simple_debian_packages'] }}
{% else %}
    - names: []
{% endif %}
