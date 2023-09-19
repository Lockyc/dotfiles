hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Hotkeys
hs.hotkey.bind({"alt"}, "1", function()
  hs.application.launchOrFocus("WezTerm.app")
end)

hs.hotkey.bind({"alt"}, "2", function()
  hs.application.launchOrFocus("/Users/lockyc/github/Lockyc/scratchpad/out/scratchpad-darwin-x64/scratchpad.app")
end)

hs.hotkey.bind({"alt"}, "3", function()
  hs.application.launchOrFocus("Soulver 3.app")
end)

local function directoryLaunchKeyRemap(mods, key, dir)
    local mods = mods or {}
    hs.hotkey.bind(mods, key, function()
        local shell_command = "open " .. dir
        hs.execute(shell_command)
    end)
end

-- directoryLaunchKeyRemap({"alt"}, "4", "'/Users/lockyc/Library/CloudStorage/GoogleDrive-lachlan@cairnspatios.com.au/Shared drives/Cairns Patios/Clients'") 
directoryLaunchKeyRemap({"alt"}, "4", "'/Users/lockyc/Library/Group Containers/G69SCX94XU.duck/Library/Application Support/duck/Volumes.noindex/Cairns Patios/Shared Drives/Cairns Patios/Clients'") 
directoryLaunchKeyRemap({"alt"}, "5", "~/Downloads") 

hs.alert.show("Config loaded") 