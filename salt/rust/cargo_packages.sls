include:
  - rust

racer-autocomplete-installed:
  cmd.run:
    - name: cargo install -q racer
    - onlyif: [ ! -z $(command -v racer) ]
    - runas: ljk
    - require:
      - rust-compiler-installed
      - cargo-installed

rustfmt-installed:
  cmd.run:
    - name: rustup run stable cargo install rustfmt
    - onlyif: [ ! -z $(command -v rustfmt) ]
    - runas: ljk
    - require:
      - rust-compiler-installed
      - cargo-installed
