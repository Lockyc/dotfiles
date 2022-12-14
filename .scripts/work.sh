#!/usr/bin/env bash

# "Startup" script for work environment

osascript -e "set Volume 0"
open -a "/Applications/nativefier/Gmail-darwin-x64/Gmail.app"
open -a "/Applications/nativefier/Google Calendar-darwin-x64/Google Calendar.app"
open -a "/Applications/nativefier/Google Chat-darwin-x64/Google Chat.app"
open -a "/Applications/nativefier/GanttPro-darwin-x64/GanttPro.app"
open -a "/Applications/nativefier/Estimating Resources-darwin-x64/Estimating Resources.app"
open -a "Google Chrome" --args --profile-directory="Profile 1"
open -a "monday.com"
open -a "messages"
open -a "slack"
open -a "music"
open -a "element"
open -a "Sublime Text"