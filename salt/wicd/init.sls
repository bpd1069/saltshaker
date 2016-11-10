wicd-cli-installed:
  pkg.installed:
    - name: wicd-cli

wicd-curses-installed:
  pkg.installed:
    - name: wicd-curses

stop-network-manager-service:
  service.dead:
    - name: NetworkManager
    - enable: false

start-wicd-service:
  service.running:
    - name: wicd
    - enable: true

