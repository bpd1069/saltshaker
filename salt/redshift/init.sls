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

redshift-cron-entry-exists:
  cron.present:
    - name: redshift -l 47.6:-122.3 -c /home/ljk/.config/redshift.conf -o
    - identifier: REDSHIFT
    - user: ljk
    - minute: '*/5'
    - require:
      - redshift-installed
      - redshift-ljk-configured
      - crontab-exists-ljk
