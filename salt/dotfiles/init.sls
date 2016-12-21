include:
  - lua

download-ljk-dotfiles:
  cmd.run:
    - name: git clone https://github.com/lucaskolstad/dotfiles/ /home/ljk/dotfiles
    - creates: /home/ljk/dotfiles
    - runas: ljk

# This should only run if there are none of my dotfiles in place yet. If some
# are there, we don't wanna overwrite anything automatically so let's just not.
install-ljk-dotfiles:
  cmd.run:
    - name: luajit /home/ljk/dotfiles/deploy.lua
    # I should rethink doing it this way with .lib instead of a better indicator
    - creates: /home/ljk/.lib
    - runas: root
    - requires:
      - pkgs:
        - download-ljk-dotfiles
        - luajit-installed
        - luaposix-installed
