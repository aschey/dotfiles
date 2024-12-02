local wezterm = require("wezterm")
local act = wezterm.action
local config = {
	font = wezterm.font("CaskaydiaCove Nerd Font Mono"),
	color_scheme = "Catppuccin Mocha",
	enable_wayland = true,
	use_fancy_tab_bar = false,
	tab_max_width = 32,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	status_update_interval = 500,
	leader = { key = "a", mods = "CTRL" },
	keys = {
		{
			key = "LeftArrow",
			mods = "CTRL|ALT",
			action = act.SplitPane({
				direction = "Left",
				size = { Percent = 50 },
			}),
		},
		{
			key = "RightArrow",
			mods = "CTRL|ALT",
			action = act.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "DownArrow",
			mods = "CTRL|ALT",
			action = act.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "UpArrow",
			mods = "CTRL|ALT",
			action = act.SplitPane({
				direction = "Up",
				size = { Percent = 50 },
			}),
		},
		{
			key = "w",
			mods = "CTRL|ALT",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "LeftArrow",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "RightArrow",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		{
			key = "DownArrow",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Down", 5 }),
		},
		{
			key = "UpArrow",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Up", 5 }),
		},
		{
			key = "n",
			mods = "CTRL|ALT",
			action = wezterm.action.SpawnCommandInNewTab({
				cwd = "/home/aschey/.config/nvim",
				args = { "nvim", "." },
			}),
		},
	},
}

--local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
--modal.apply_to_config(config)
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({})
local tabline_config = require("tabline.config")
config.colors = {
	tab_bar = {
		background = tabline_config.colors.normal_mode.c.bg,
		new_tab = {
			bg_color = tabline_config.colors.normal_mode.c.bg,
			fg_color = tabline_config.colors.normal_mode.c.fg,
		},
	},
}
--tabline.apply_to_config(config)

return config
