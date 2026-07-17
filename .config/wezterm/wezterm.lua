local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe" }
config.front_end = "WebGpu"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.webgpu_power_preference = "HighPerformance"

config.color_scheme = "Gruvbox Dark (Gogh)"

return config
