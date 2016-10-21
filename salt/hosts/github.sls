github-main-host-entry:
  host.present:
    - ip: 192.30.253.113
    - names:
      - github.com

github-api-host-entry:
  host.present:
    - ip: 192.30.253.116
    - name: api.github.com

github-ssh-host-entry:
  host.present:
    - ip: 192.30.253.122
    - name: ssh.github.com

github-app-collector-host-entry:
  host.present:
    - ip: 54.236.140.90
    - name: collector.githubapp.com

github-static-content-host-entry:
  host.present:
    - ip: 151.101.44.133
    - names:
      - assets-cdn.github.com
      - avatars0.githubusercontent.com
      - avatars1.githubusercontent.com
      - avatars2.githubusercontent.com
      - avatars3.githubusercontent.com
