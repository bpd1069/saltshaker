{% if grains['os'] == 'Arch' %}
pacuaur-installed:
  pkg.installed:
    - name: pacaur
{% endif %}
