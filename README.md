# Saltshaker

My own personal collection of salt files and system setup scripts.

This is meant for a heavy desktop or laptop system used for development work so
the whole kitchen sink is thrown in there. Languages, tools, as well as my own
system configuration preferences that don't belong in my dotfiles (though the
dotfiles themselves are automatically downloaded and installed by this project).

### Applying to the local system

Download this repository somewhere and call the `deploy.sh` script as root.

You can see some options and explanation with the help option: `./deploy.sh -h`

This will attempt to bootstrap up to a state where salt can be run then runs it
to set up the localhost. This handles the case where you only managed to
download this repo onto a fresh OS install and want to assume a minimal system.

You can pass options to the deployment script which will be appended to a call
to: `salt-call state.apply --state_verbose=false --local`.

### Compatibility

This project is only regularly used on my Arch and Ubuntu systems. Any other
distributions probably won't completely work. Any other OS other than Linux
will almost assuredly not work.

### Attribution & Licenses

Some code is often taken from or based on salt-formulas that have been cut down
and altered.

Assume attribution to the appropriate salt-formula authors where there is
matching content. The license applying to the code in particular directory is
available in a corresponding repository from
[saltstack-formulas.](https://github.com/saltstack-formulas)
