include:
<<<<<<< HEAD
  - cron
=======
  - geoclue
  - users
>>>>>>> 979f88b5cd99b584ebe31258fc3daa4d3a66dca6

redshift-installed:
  pkg.installed:
    - name: redshift

<<<<<<< HEAD
redshift-ljk-configured:
  file.managed:
    - name: /home/ljk/.config/redshift.conf
    - source:
      - salt://redshift/files/redshift.conf
    - user: ljk
    - group: ljk
    - file_mode: 755
=======
redshift-service:
  service.running:
    - name: redshift
    - enable: true
>>>>>>> 979f88b5cd99b584ebe31258fc3daa4d3a66dca6
    - require:
      - redshift-installed

<<<<<<< HEAD
redshift-cron-entry-exists:
  cron.present:
    - name: redshift -l 48:-122 -c /home/ljk/.config/redshift.conf -o
    - identifier: REDSHIFT
    - user: ljk
    - minute: '*/5'
    - require:
      - redshift-installed
      - redshift-ljk-configured
      - crontab-exists-ljk
=======
redshift-unit-file-installed:
  file.managed:
    - name: /etc/systemd/system/redshift.service
    - source:
      - salt://redshift/files/redshift.service
    - user: root
    - group: root

{% for name, user in pillar.get('users', {}).items()
        if user.absent is not defined or not user.absent %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}
{%- set current = salt.user.info(name) -%}
{%- set home = user.get('home', current.get('home', "/home/%s" % name)) -%}

{%- if 'prime_group' in user and 'name' in user['prime_group'] %}
{%- set user_group = user.prime_group.name -%}
{%- else -%}
{%- set user_group = name -%}
{%- endif %}

redshift-configured:
  file.managed:
    - name: {{ home }}/.config/redshift.conf
    - source:
      - salt://redshift/files/redshift.conf
    - user: {{ name }}
    - group: {{ user_group }}
    - file_mode: 750
    - require:
      - user: users_{{ name }}_user
      - group: {{ user_group }}
      - users_config_dir_{{ name }}

{% endfor %}

>>>>>>> 979f88b5cd99b584ebe31258fc3daa4d3a66dca6
