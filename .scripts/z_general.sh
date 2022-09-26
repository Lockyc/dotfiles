#!/usr/bin/env bash

#brightness 1 #bug with macOS Ventura beta, screen brightness defaults to ~80% on restart
osascript -e "set Volume 0"
open -a "Amphetamine"
open -a "SlowQuitApps"
open -a "Unsplash Wallpapers"
# sudo pmset schedule cancelall #another bug with macOS Ventura Beta, powerd spins up to 100% and fans are at 100%