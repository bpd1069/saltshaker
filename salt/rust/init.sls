{% from "rust/map.jinja" import rust_settings with context %}

rust-compiler-installed:
  pkg.installed:
    - name: {{ rust_settings.rust_pkg }}

cargo-installed:
  pkg.installed:
    - name: cargo
    - require:
      - rust-compiler-installed

rust-debuggers-installed:
  pkg.installed:
    - pkgs: {{ rust_settings.debugger_pkgs }}
    - require:
      - rust-compiler-installed

racer-autocomplete-installed:
  cmd.run:
    - name: cargo install racer
    - onlyif: [ ! -e /home/ljk/.cargo/bin/racer ]
    - runas: ljk
    - require:
      - rust-compiler-installed
      - cargo-installed

rust-symlink-created:
  file.symlink:
    - name: /usr/bin/rust
    - target: /usr/bin/{{ rust_settings.rust_pkg }}
    - mode: 755
    - require: 
      - rust-compiler-installed
