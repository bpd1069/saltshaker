arduino-udev-rule:
  file.managed:
    - name: /etc/udev/rules.d/72-arduino.rules
    - source: salt://avr-toolchain/files/72-arduino.rules
    - user: root
    - group: root
    - mode: 644
