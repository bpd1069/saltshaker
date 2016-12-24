{% from "python/map.jinja" import python with context %}

python-dev-pkgs-installed:
  pkg.installed:
    - pkgs: {{ python.dev_pkgs }}

python2-installed:
  pkg.installed:
    - name: {{ python.python2_pkg }}
    - require:
      - python-dev-pkgs-installed

python3-installed:
  pkg.installed:
    - name: {{ python.python3_pkg }}
    - require:
      - python-dev-pkgs-installed

pip-installed:
  pkg.installed:
    - name: {{ python.pip_pkg }}

virtualenv-installed:
  pip.installed:
    - name: virtualenv

pypy-installed:
  pkg.installed:
    - name: pypy
