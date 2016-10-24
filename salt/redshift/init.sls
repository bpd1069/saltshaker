include:
  - geoclue

redshift-installed:
  pkg.installed:
    - name: redshift
    - requires:
      pkg: geoclue-installed

redshift-configured:
  file.managed:
    - name: /home/ljk/.config/redshift.conf
    - source:
      - salt://redshift/files/redshift.conf
    - user: ljk
    - group: ljk
    - file_mode: 750

redshift-service:
  service.running:
    - name: redshift
    - enable: true
    - require:
      - redshift-unit-file-installed

redshift-unit-file-installed:
  file.managed:
    - name: /etc/systemd/system/redshift.service
    - source:
      - salt://redshift/files/redshift.service
    - user: ljk
    - group: ljk
