include:
  - core.essential_packages

install-with-rustup:
  cmd.run:
    - name: curl -sSf https://static.rust-lang.org/rustup.sh > /tmp/rustup.sh ; sh /tmp/rustup.sh -y
    - onlyif: [ ! -z $(command -v rustup) ]
    - require:
      - essential_packages

rust-source-installed:
  cmd.run:
    - name: git clone https://github.com/rust-lang/rust /usr/local/src/rust
    - creates: /usr/local/src/rust
    - runas: root
    - mode: 755
