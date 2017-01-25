simple-cabal-packages-installed:
  cabal.installed:
    - names: {{ pillar['simple_cabal_packages'] }}
