-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config = {
	color_scheme = 'Aura Dark',
	-- color_scheme = 'Afterglow',
	font = wezterm.font 'Hack Nerd Font Propo',
	font_size = 22.0,
	window_decorations = "RESIZE",
	use_fancy_tab_bar = false,
	enable_tab_bar = false,
	window_background_opacity = 0.7,
	macos_window_background_blur = 35
}

return config
