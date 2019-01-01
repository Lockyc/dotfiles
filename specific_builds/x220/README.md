# x220

## WiFi

My WiFi card (Intel® Centrino® Advanced-N 6205) seems to have issues with:

- Power management
- Docking

WOL is disabled in BIOS.

### iwlwifi

`/etc/modprobe.d/iwlwifi.conf`

```
options iwlwifi 11n_disable=1 swcrypto=1 bt_coex_active=0 power_save=0
options iwldvm force_cam=1
```

### TLP
