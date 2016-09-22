salt:
  # Set this to true to clean any non-salt-formula managed files out of
  # /etc/salt/{master,minion}.d ... You really don't want to do this on 2015.2
  # and up as it'll wipe out important files that Salt relies on.
  clean_config_d_dir: False

  # This state will remove "/etc/salt/minion" when you set this to true.
  minion_remove_config: True

  # This state will remove "/etc/salt/master" when you set this to true.
  master_remove_config: True

  install_packages: True
