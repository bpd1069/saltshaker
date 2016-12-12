include:
  - wget

youtube-dl-package-installed:
  cmd.run:
    - name: wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl ; chmod a+rx /usr/local/bin/youtube-dl
    - creates: /usr/local/bin/youtube-dl
    - requires: wget
