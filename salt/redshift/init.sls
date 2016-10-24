include:
  - geoclue
  - users

redshift-installed:
  pkg.installed:
    - name: redshift
    - requires:
      pkg: geoclue-installed

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

