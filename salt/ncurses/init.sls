ncurses-base-installed:
  pkg.installed:
{% if grains['os'] == 'Arch' %}
    - name: ncurses
{% else %}
    - name: ncurses-base
{% endif %}


{% if grains['os_family'] == 'Debian' %}
ncurses-bin-installed:
  pkg.installed:
    - name: ncurses-bin

ncurses-dev-installed:
  pkg.installed:
    - name: libncurses5-dev
{% endif %}