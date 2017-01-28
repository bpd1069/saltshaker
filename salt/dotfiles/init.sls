ensure-home-code-dir-exists:
  file.directory:
    - name: ~/code
    - user: ljk
    - group: ljk


download-ljk-dotfiles:
  cmd.run:
    - name: git clone https://github.com/lucaskolstad/dotfiles/ /home/ljk/code/dotfiles
    - creates: /home/ljk/code/dotfiles
    - runas: ljk
    - requires:
      - pkgs:
        - ensure-home-code-dir-exists

install-ljk-dotfiles:
  cmd.run:
    - name: luajit /home/ljk/code/dotfiles/deploy.sh
    - onchanges:
      - download-ljk-dotfiles
    - runas: ljk
    - requires:
      - pkgs:
        - download-ljk-dotfiles
