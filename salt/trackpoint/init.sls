trackpoint-settings-udev-rule:
  file.managed:
    - name: /etc/udev/rules.d/10-trackpoint.rules
    - source: salt://trackpoint/files/10-trackpoint.rules
    - user: root
    - group: root
    - mode: 644
