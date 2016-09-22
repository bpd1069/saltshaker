# Salt Shaker

My own personal collection of salt files.

### Applying to your local system

Ensure you have `salt-minion` installed on your system.

You probably need `/srv` to be empty in order to clone into it like this, but
ensure you have this repository in place inside that directory.

```bash
sudo git clone https://github.com/lucaskolstad/saltshaker /srv
sudo salt-call state.highstate --local
```

Several directories are near clones of salt-formulas that I've cut down to just
what I need. Assume attribution to the appropriate salt-formula authors.
