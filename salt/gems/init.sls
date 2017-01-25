gems-installed:
  gem.installed:
    - names: {{ pillar['simple_gem_packages'] }}
