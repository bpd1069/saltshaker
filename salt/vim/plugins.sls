include:
  - vim

ljk-vim-bundle-dir-exists:
  file.directory:
    - name: /home/ljk/.vim/bundle
    - user: ljk
    - group: ljk
    - mode: 755
    - makedirs: true
    - require:
      - vim-installed

ljk-vundle-installed:
  cmd.run:
    - name: git clone https://github.com/VundleVim/Vundle.vim.git /home/ljk/.vim/bundle/Vundle.vim
    - creates: /home/ljk/.vim/bundle/Vundle.vim
    - runas: ljk
    - requires:
      - ljk-vim-bundle-dir-exists

ljk-vim-plugins-installed:
  cmd.run:
    - name: vim +PluginInstall +qall > /dev/null 2>&1
    - creates:
# These are just two plugins I think are really likely to stay a long time.
# I'm probably going to forget this creates rule only is sensical when I still
# have these plugins
      - /home/ljk/.vim/bundle/syntastic
      - /home/ljk/.vim/bundle/L9
    - runas: ljk
    - requires:
      - ljk-vundle-installed
