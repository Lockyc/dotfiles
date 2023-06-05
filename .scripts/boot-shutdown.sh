#!/bin/bash
function shutdown()
{

  # INSERT HERE THE COMMAND YOU WANT EXECUTE AT SHUTDOWN OR SERVICE UNLOAD
	rm /Users/*/Library/Preferences/ByHost/com.apple.loginwindow.*
	rm -rf /Users/lockyc/Library/Saved\ Application\ State/*

  exit 0
}

function startup()
{

  # INSERT HERE THE COMMAND YOU WANT EXECUTE AT STARTUP OR SERVICE LOAD
	rm /Users/*/Library/Preferences/ByHost/com.apple.loginwindow.*
	rm -rf /Users/lockyc/Library/Saved\ Application\ State/*

  tail -f /dev/null &
  wait $!
}

trap shutdown SIGTERM
trap shutdown SIGKILL

startup;
