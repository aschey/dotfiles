local wezterm = require("wezterm")
local act = wezterm.action
local config = {
	font = wezterm.font("CaskaydiaCove Nerd Font Mono"),
	enable_wayland = true,
	use_fancy_tab_bar = false,
	enable_kitty_keyboard = false,
	term = "wezterm",
	tab_max_width = 32,
	-- window_padding = {
	-- 	left = 0,
	-- 	right = 0,
	-- 	top = 0,
	-- 	bottom = 0,
	-- },
	status_update_interval = 500,
	-- copy of https://github.com/catppuccin/wezterm/blob/main/dist/catppuccin-mocha.toml
	-- without overriding indexed colors 16 and 17 because it can clash with some apps' colors
	colors = {
		ansi = {
			"#45475a",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#89b4fa",
			"#f5c2e7",
			"#94e2d5",
			"#bac2de",
		},
		background = "#1e1e2e",
		brights = {
			"#585b70",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#89b4fa",
			"#f5c2e7",
			"#94e2d5",
			"#a6adc8",
		},

		compose_cursor = "#f2cdcd",
		cursor_bg = "#f5e0dc",
		cursor_border = "#f5e0dc",
		cursor_fg = "#11111b",
		foreground = "#cdd6f4",
		scrollbar_thumb = "#585b70",
		selection_bg = "#585b70",
		selection_fg = "#cdd6f4",
		split = "#6c7086",
		visual_bell = "#313244",
		tab_bar = {
			background = "#11111b",
			inactive_tab_edge = "#313244",
			active_tab = {
				bg_color = "#cba6f7",
				fg_color = "#11111b",
				intensity = "Normal",
				italic = false,
				strikethrough = false,
				underline = "None",
			},
			inactive_tab = {
				bg_color = "#181825",
				fg_color = "#cdd6f4",
				intensity = "Normal",
				italic = false,
				strikethrough = false,
				underline = "None",
			},
			inactive_tab_hover = {
				bg_color = "#1e1e2e",
				fg_color = "#cdd6f4",
				intensity = "Normal",
				italic = false,
				strikethrough = false,
				underline = "None",
			},
			new_tab = {
				bg_color = "#313244",
				fg_color = "#cdd6f4",
				intensity = "Normal",
				italic = false,
				strikethrough = false,
				underline = "None",
			},
			new_tab_hover = {
				bg_color = "#45475a",
				fg_color = "#cdd6f4",
				intensity = "Normal",
				italic = false,
				strikethrough = false,
				underline = "None",
			},
		},
	},
	leader = { key = "a", mods = "CTRL" },
	keys = {
		{
			key = "LeftArrow",
			mods = "ALT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "ALT",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "ALT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "ALT",
			action = act.ActivatePaneDirection("Down"),
		},
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
config.colors.tab_bar.background = tabline_config.colors.normal_mode.c.bg
config.colors.tab_bar.new_tab.bg_color = tabline_config.colors.normal_mode.c.bg
config.colors.tab_bar.new_tab.fg_color = tabline_config.colors.normal_mode.c.fg

return config
