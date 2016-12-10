# Saltshaker

My own personal collection of salt files and system setup scripts.

These are used on my everyday dev systems that want all my desktop apps as well
as many dev tools installed by default. Salt is used to improve portability of
the configuration management across a variety of Unix style platforms.

### Applying to the local system

Download this repository somewhere and call the `deploy.sh` script as root.

This will attempt to bootstrap up to a state where salt can be run, then will
apply the salt configuration on the localhost.

You can pass arguments to the deployment script which will be appended to a
call to: `salt-call state.apply --state_verbose=false --local` and can be used
to request more/different output.

### Compatibility

This project is only regularly tested on my Arch and Ubuntu systems. Any other
distributions probably won't work. When I encounter new systems I do add fixes
though.

### Attribution & Licenses

Some code is taken from salt-formulas that have been cut down and altered.

Assume attribution to the appropriate salt-formula authors where there is
matching content. The license applying to the code in particular directory is
available in a corresponding repository from
[saltstack-formulas.](https://github.com/saltstack-formulas)
