download-ljk-dotfiles:
  cmd.run:
    - name: git clone https://github.com/lucaskolstad/dotfiles/ /home/ljk/dotfiles
    - creates: /home/ljk/dotfiles
    - runas: ljk

# This should only run if there are none of my dotfiles on the system yet at
# all. If some are there, we don't wanna overwrite anything automatically.
install-ljk-dotfiles:
  cmd.run:
    - name: bash /home/ljk/dotfiles/deploy.sh
    - creates: /home/ljk/.lib
    - runas: ljk
    - requires:
      - pkg: download-ljk-dotfiles
