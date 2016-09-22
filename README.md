# Salt Shaker

My own personal collection of salt files.

### Applying to the local system

Ensure you have `salt-minion` installed.

You probably need `/srv` to be empty in order to clone into it like this, but
you just need to have this repository inside that directory.

```bash
sudo git clone https://github.com/lucaskolstad/saltshaker /srv
sudo salt-call state.highstate --local
```

Several directories are near clones of salt-formulas that I've cut down. Assume
attribution to the appropriate salt-formula authors.
