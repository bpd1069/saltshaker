spacemacs-installed:
  cmd.run:
    - name: git clone https://github.com/syl20bnr/spacemacs /home/ljk/.emacs.d
    - runas: ljk
    - creates: /home/ljk/.emacs.d/spacemacs.mk
