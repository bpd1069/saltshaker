avr-compiler-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - name: gcc-avr
{% elif grains['os'] == 'Arch' %}
    - name: avr-gcc
{% endif %}

avr-programmer-installed:
  pkg.installed:
    - name: avrdude

avr-binutils-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - name: binutils-avr
{% elif grains['os'] == 'Arch' %}
    - name: avr-binutils
{% endif %}

{% if grains['os_family'] == 'Debian' %}
avr-assembler-installed:
  pkg.installed:
    - name: avra
{% endif %}

avr-debugger-installed:
  pkg.installed:
{% if grains['os_family'] == 'Debian' %}
    - name: gdb-avr
{% elif grains['os'] == 'Arch' %}
    - name: avr-gdb
{% endif %}

avr-libc-installed:
  pkg.installed:
    - name: avr-libc

include:
  - avr-toolchain.arduino
