include:
  - core.essential_packages

rust-installed:
  cmd.run:
    - name: curl -sSf https://sh.rustup.rs | sh -s -- -y
    - onlyif: [ -z "$(command -v rustup)" ]
    - runas: ljk
    - require:
      - essential-packages

rustup-bash-completion-installed:
  cmd.run:
    - name: /home/ljk/.cargo/bin/rustup completions bash > /etc/bash_completion.d/rustup.bash_completion
    - creates: /etc/bash_completion.d/rustup.bash_completion
    - require:
      - rust-installed
      - bash-completions-dir-exists

rust-source-installed:
  cmd.run:
    - name: /home/ljk/.cargo/bin/rustup component add rust-src
{% if grains['os'] == 'FreeBSD' %}
    - creates: /home/ljk/.multirust/toolchains/stable-x86_64-unknown-freebsd/lib/rustlib/src/rust/src
{% else %}
    - creates: /home/ljk/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
{% endif %}
    - mode: 750

bash-completions-dir-exists:
  file.directory:
    - name: /etc/bash_completion.d
    - makedirs: True
