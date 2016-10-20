avr-debugger-installed:
  pkg.installed:
    - name: gdb-avr

avr-compiler-installed:
  pkg.installed:
    - name: gcc-avr

avr-programmer-installed:
  pkg.installed:
    - name: avrdude

avr-programmer-docs-installed:
  pkg.installed:
    - name: avrdude-doc

avr-binutils-installed:
  pkg.installed:
    - name: binutils-avr

avr-assembler-installed:
  pkg.installed:
    - name: avra

avr-libc-installed:
  pkg.installed:
    - name: avr-libc

avr-simulator-installed:
  pkg.installed:
    - name: simulavr

#include:
#  - avr-toolchain.arduino
