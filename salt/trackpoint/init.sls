trackpoint-settings-udev-rule:
  file.managed:
    - name: /etc/udev/rules.d/50-trackpoint.rules
    - source: salt://trackpoint/files/50-trackpoint.rules
    - user: root
    - group: root
    - mode: 644
