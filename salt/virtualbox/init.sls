virtualbox-installed:
  pkg.installed:
    - name: virtualbox

{% if grains['os'] == 'Arch' %}
virtualbox-host-modules-provider-installed:
  pkg.installed:
    - name: virtualbox-host-modules-arch
{% endif %}
