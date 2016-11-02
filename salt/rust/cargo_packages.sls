include:
  - rust

racer-autocomplete-installed:
  cmd.run:
    - name: cargo install racer
    - onlyif: [ -z $(command -v racer) ]
    - runas: ljk
    - require:
      - rust-installed
      - cargo-installed

rustfmt-installed:
  cmd.run:
    - name: rustup run stable cargo install rustfmt
    - onlyif: [ -z $(command -v rustfmt) ]
    - runas: ljk
    - require:
      - rust-installed
      - cargo-installed

ripgrep-installed:
  cmd.run:
    - name: cargo install ripgrep
    - onlyif: [ -z $(command -v rg) ]
    - runas: ljk
    - require:
      - rust-installed
      - cargo-installed
