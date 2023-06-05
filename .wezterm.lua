local wezterm = require 'wezterm'
local config = {}
config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Dracula"
config.initial_cols = 160
config.initial_rows = 50

return config