golang-installed:
  pkg.installed:
{% if grains['os'] == 'Arch' %}
    - name: go
{% else %}
    - name: golang
{% endif %}
