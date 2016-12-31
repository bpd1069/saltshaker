include:
  - lua

download-ljk-dotfiles:
  cmd.run:
    - name: git clone https://github.com/lucaskolstad/dotfiles/ /home/ljk/code/dotfiles
    - creates: /home/ljk/code/dotfiles
    - runas: ljk
    - requires:
      - pkgs:
        - ensure-home-code-dir-exists

ensure-home-code-dir-exists:
  file.directory:
    - name: ~/code
    - user: ljk
    - group: ljk

# This should only run if there are none of my dotfiles in place yet. If some
# are there, we don't wanna overwrite anything automatically so let's just not.
install-ljk-dotfiles:
  cmd.run:
    - name: luajit /home/ljk/code/dotfiles/deploy.lua
    - onchanges:
      - download-ljk-dotfiles
    - runas: ljk
    - requires:
      - pkgs:
        - download-ljk-dotfiles
        - luajit-installed
        - luaposix-installed
