
cron-installed:
  pkg.installed:
{% if grains['os'] == 'Arch' %}
    - name: cronie
{% else %}
    - name: cron
{% endif %}

crontab-exists:
  cmd.run:
    - name: mkdir -p /var/spool/cron/crontabs
    - runas: root
    - creates: /var/spool/cron/crontabs

crontab-exists-ljk:
  cmd.run:
    - name: touch /var/spool/cron/crontabs/ljk
    - runas: root
    - creates: /var/spool/cron/crontabs/ljk
    - requires:
      - cron-installed
      - crontab-exists

crontab-exists-root:
  cmd.run:
    - name: touch /var/spool/cron/crontabs/root
    - runas: root
    - creates: /var/spool/cron/crontabs/root
    - requires:
      - cron-installed
      - crontab-exists
