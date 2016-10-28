docker-installed:
  cmd.run:
     - name: curl -fsSL https://get.docker.com/ | sh
     - onlyif: [ -z "$(which docker)" ]
