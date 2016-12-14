include:
  - nvim

ljk-nvim-bundle-dir-exists:
  file.directory:
    - name: /home/ljk/.config/nvim/bundle
    - user: ljk
    - group: ljk
    - mode: 755
    - makedirs: true

ljk-vundle-installed:
  cmd.run:
    - name: git clone https://github.com/VundleVim/Vundle.vim.git /home/ljk/.config/nvim/bundle/Vundle.vim
    - creates: /home/ljk/.config/nvim/bundle/Vundle.vim
    - runas: ljk
    - requires:
      - ljk-nvim-bundle-dir-exists

ljk-nvim-plugins-installed:
  cmd.run:
    - name: nvim +PluginInstall +qall > /dev/null 2>&1
    - creates:
# These are just two plugins I think are really likely to stay a long time.
# I'm probably going to forget this creates rule only is sensical when I still
# have these plugins
      - /home/ljk/.config/nvim/bundle/syntastic
      - /home/ljk/.config/nvim/bundle/L9
    - runas: ljk
    - requires:
      - ljk-vundle-installed
