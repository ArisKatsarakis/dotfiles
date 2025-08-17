-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
-- This will hold the configuration.
local action = wezterm.action
local config = wezterm.config_builder()

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config = {
	-- color_scheme = "Nord",
	-- color_scheme = "Afterglow",
	font = wezterm.font("Hack Nerd Font Propo"),
	font_size = 22.0,
	window_decorations = "RESIZE",
	use_fancy_tab_bar = false,
	enable_tab_bar = true,
	window_background_opacity = 0.8,
	-- macos_window_background_blur = 35,
}
-- config.color_scheme = "nordfox"
config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Kanagawa Dragon (Gogh)"
config.term = "xterm-256color"

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2001 }
-- split wezterm to panes
local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

config.keys = {
	{
		key = "-",
		mods = "LEADER",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "|",
		mods = "LEADER",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = action.TogglePaneZoomState,
	},
	{
		key = "c",
		mods = "LEADER",
		action = action.SpawnTab("CurrentPaneDomain"),
	},

	{
		key = "p",
		mods = "LEADER",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = action.ActivateTabRelative(1),
	},
	{ key = "[", mods = "LEADER", action = action.ActivateCopyMode },
	-- split_nav("move", "h"),
	-- split_nav("move", "j"),
	-- split_nav("move", "k"),
	-- split_nav("move", "l"),
}

-- insert numbers to panes
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

-- example enable spotify module
bar.apply_to_config(config, {
	modules = {
		spotify = {
			enabled = true,
		},
	},
})
return config
