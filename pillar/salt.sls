salt:
  # Set this to true to clean any non-salt-formula managed files out of
  # /etc/salt/{master,minion}.d ... You really don't want to do this on 2015.2
  # and up as it'll wipe out important files that Salt relies on.
  clean_config_d_dir: False

  # This state will remove "/etc/salt/minion" when you set this to true.
  minion_remove_config: False

  # This state will remove "/etc/salt/master" when you set this to true.
  master_remove_config: False

  # Set this to False to not have the formula install packages (in the case you
  # install Salt via git/pip/etc.)
  install_packages: True

  # to overwrite map.jinja salt packages
  lookup:
    salt-master: 'salt-master'
    salt-minion: 'salt-minion'
    salt-syndic: 'salt-syndic'
    salt-cloud: 'salt-cloud'
    salt-ssh: 'salt-ssh'

  minion:
    master_type: 'disable'
    file_roots:
      base:
        - /srv/salt
    pillar_roots:
      base:
        - /srv/pillar

salt_formulas:
  git_opts:
    default:
      baseurl: https://github.com/saltstack-formulas
      basedir: /srv/formulas
      update: False
  basedir_opts:
    makedirs: True
    user: root
    group: root
    mode: 755
  list:
    base:
      - node-formula
