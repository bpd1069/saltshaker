iw-installed:
  pkg.installed:
    - name: iw

{% if grains['os_family'] != 'Debian' %}
wpa_supplicant_installed:
  pkg.installed:
    - name: wpa_supplicant
{% endif %}
