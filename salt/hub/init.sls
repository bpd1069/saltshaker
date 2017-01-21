hub-installed:
  cmd.run:
    - name: git clone https://github.com/github/hub.git /tmp/hub && cd /tmp/hub/ && script/build -o ~/.bin/hub
    - onlyif: [ -z "$(command -v hub)" ]
