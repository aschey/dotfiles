local wezterm = require("wezterm")
local act = wezterm.action
return {
	font = wezterm.font("CaskaydiaCove Nerd Font Mono"),
	color_scheme = "Catppuccin Mocha",
	enable_wayland = true,
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
				cwd =  "/home/aschey/.config/nvim" ,
				args = { "nvim", "." },
			}),
		},
	},
}
