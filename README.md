# Salt Shaker

My own personal collection of salt files.

### Applying to the local system

Ensure you have salt installed. Then just download this repository somewhere
and call the `deploy_locally.sh` script as root.

The deployment script will erase any other salt data in your `/srv/` directory,
so be careful, and will place this repository's salt data there. Then it will
try to apply the state to the local machine.

You can pass arguments to the deployment script which will be passed off as
additional options to a call to something like: `salt-call state.apply --local`

### Attribution & Licenses

Some code is taken from salt-formulas that have been cut down and altered.

Especially the `salt/salt` directory is a big copied blob from the formula.

Assume attribution to the appropriate salt-formula authors where there is
matching content. The license applying to the code in particular directory is
available in a corresponding repository from
[saltstack-formulas.](https://github.com/saltstack-formulas)
