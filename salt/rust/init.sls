rust-compiler-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - name: rustc
{% elif grains['os'] == 'Arch' %}
    - name: rust
{% endif %}

cargo-installed:
  pkg.installed:
    - name: cargo

racer-autocomplete-installed:
  cmd.run:
    - name: cargo install racer
    - onlyif: [ ! -e /home/ljk/.cargo/bin/racer ]
    - runas: ljk
    - require:
      - rust-compiler-installed
      - cargo-installed

{% if grains['os_family'] == 'Debian' %}
rust-lldb-installed:
  pkg.installed:
    - name: rust-lldb

rust-gdb-installed:
  pkg.installed:
    - name: rust-lldb
{% endif %}
