include:
  - cron

redshift-installed:
  pkg.installed:
    - name: redshift

redshift-ljk-configured:
  file.managed:
    - name: /home/ljk/.config/redshift.conf
    - source:
      - salt://redshift/files/redshift.conf
    - user: ljk
    - group: ljk
    - file_mode: 755
