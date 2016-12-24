ghc-installed:
  pkg.installed:
    - name: ghc

happy-installed:
  pkg.installed:
    - name: happy

alex-installed:
  pkg.installed:
    - name: alex

include:
  - haskell.cabal
