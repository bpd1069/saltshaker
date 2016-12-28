ruby-installed:
  pkg.installed:
    - name: ruby

sass-installed:
  cmd.run:
    - name: gem install sass
    - onlyif: [ -z "$(command -v sass)" ]

bundler-installed:
  cmd.run:
    - name: gem install bundler
    - onlyif: [ -z "$(command -v bundler)" ]
