# Protonvpn
- login: 
```sh
$ protonvpn-cli login <username>
```

# Chromium
- sign in
- install plugins:
  * Stylus
  * Vimium

# Firefox
- sign in
- set font configuration
- set network.protocol-handler.expose.magnet -> false (magnet links)
- set layers.acceleration.force-enabled -> true (hardware acceleration)
- set ui.key.menuAccessKeyFocuses -> false (disable alt key menu)
- install plugins:
  * AdBlocker for YouTube
  * hide-scrollbars
  * Privacy Badger
  * uBlock Origin
  * Vimium
  * Firefox Color

- install themes:
  * IndigoDark

# Remove CPU throttling
- Install msr-tools
- Create a disable_prochot service (Command to use in the service: wrmsr 0x1FC 2 (as a superuser))
- Start / Enable the service
