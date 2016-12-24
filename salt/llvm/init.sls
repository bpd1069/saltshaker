llvm-installed:
  pkg.installed:
    - name: llvm

clang-installed:
  pkg.installed:
    - name: clang
  require:
    - pkg: llvm-installed
