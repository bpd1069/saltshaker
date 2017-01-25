ncurses-base-installed:
  pkg.installed:
{% if grains['os'] == 'Arch' %}
    - name: ncurses
{% else %}
    - name: ncurses-base
{% endif %}

