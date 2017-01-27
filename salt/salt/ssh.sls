{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.install_packages %}
ensure-salt-ssh-is-installed:
  pkg.installed:
    - name: {{ salt_settings.salt_ssh }}
{% endif %}
