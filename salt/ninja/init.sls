ninja-installed:
  pkg.installed:
    {% if grains['os_family'] == 'Debian' %}
    - name: ninja-build
    {% else %}
    - name: ninja
    {% endif %}
