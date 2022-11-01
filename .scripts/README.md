# [loginfix.sh](loginfix.sh)
```bash
#!/bin/bash
echo "#!/bin/bash" > /tmp/loginfix.sh
echo "rm /Users/*/Library/Preferences/ByHost/com.apple.loginwindow.*" >> /tmp/loginfix.sh
mv /tmp/loginfix.sh /usr/bin/loginfix.sh
chmod +x /usr/bin/loginfix.sh
defaults write com.apple.loginwindow LoginHook /usr/bin/loginfix.sh
```

If you ever want to revert back to the default behavior of this OS X Lion feature, just type the following defaults write command:

```bash
sudo defaults delete com.apple.loginwindow LoginHook
```
**sources:**
- https://discussions.apple.com/thread/3298755
- https://osxdaily.com/2011/08/25/disable-reopen-windows-when-logging-back-in-in-mac-os-x-lion-completely/


# Disable saving the application state on shutdown

```bash
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
```

---
<sup>[cheatsheet](https://github.com/Lockyc/cheatsheet) | [dotfiles](https://github.com/Lockyc/dotfiles)<sup>
