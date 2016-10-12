include:
  - llvm

clang-installed:
  pkg.installed:
    - name: clang
  require:
    - pkg: llvm-installed
