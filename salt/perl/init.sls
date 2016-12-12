perl-installed:
  pkg.installed:
    - name: perl

{% if grains['os_family'] == 'Debian' %}
perl-docs-installed:
  pkg.installed:
    - name: perl-doc
{% endif %}
