# Salt Shaker

My own personal collection of salt files.

### Applying to the local system

Ensure you have salt installed.

Then download this repository somewhere:

```bash
git clone https://github.com/lucaskolstad/saltshaker
```

The deployment script `deploy_locally.sh` will erase any other salt data in
your `/srv/` directory, so be careful, and will place this repository's
contents there. Then it will try to apply the state to the local machine.

### Attribution & Licenses

Some code is taken from salt-formulas that have been cut down and altered.
Assume attribution to the appropriate salt-formula authors where there is
matching content. The license applying to the code in particular directory is
available in a corresponding repository from
[saltstack-formulas.](https://github.com/saltstack-formulas)
