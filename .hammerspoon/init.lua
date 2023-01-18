hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse("ReloadConfiguration")
spoon.ReloadConfiguration:start()


-- Hotkeys
hs.hotkey.bind({"alt"}, "1", function()
  hs.application.launchOrFocus("WezTerm.app")
end)

hs.hotkey.bind({"alt"}, "2", function()
  hs.application.launchOrFocus("Sublime Text.app")
end)

hs.hotkey.bind({"alt"}, "3", function()
  hs.application.launchOrFocus("Soulver 3.app")
end)


hs.alert.show("Config loaded") 