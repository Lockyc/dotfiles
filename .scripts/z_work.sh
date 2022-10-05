#!/usr/bin/env bash

#brightness 1 #bug with macOS Ventura beta, screen brightness defaults to ~80% on restart
osascript -e "set Volume 0"
open -a "/Applications/nativefier/Gmail-darwin-x64/Gmail.app"
open -a "/Applications/nativefier/Google Calendar-darwin-x64/Google Calendar.app"
open -a "/Applications/nativefier/Google Chat-darwin-x64/Google Chat.app"
open -a "/Applications/nativefier/GanttPro-darwin-x64/GanttPro.app"
open -a "/Applications/nativefier/Estimating Notes-darwin-x64/Estimating Notes.app"
open -a "/Applications/nativefier/Estimating Resources-darwin-x64/Estimating Resources.app"
open -a "monday.com"
open -a "messages"
open -a "slack"
open -a "music"
open -a "element"
open -a "Sublime Text"