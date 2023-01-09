hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse("ReloadConfiguration")
spoon.ReloadConfiguration:start()


hs.hotkey.bind({"alt"}, "1", function()
  hs.application.launchOrFocus("WezTerm.app")
end)



hs.alert.show("Config loaded") 