-- Pull in the wezterm API
local wezterm = require("wezterm")
local splits = require("smart-splits")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.keys = splits
-- For example, changing the color scheme:
config.color_scheme = "Ayu Dark (Gogh)"
config.font = wezterm.font("SFMono Nerd Font", { weight = "DemiBold" })
config.font_size = 12.5
config.underline_position = "-3px"
config.line_height = 1.1
config.hide_tab_bar_if_only_one_tab = true
config.animation_fps = 60
config.initial_cols = 180
config.use_ime = true
config.initial_rows = 60
config.window_padding = {
	left = 10,
	right = 10,
	top = "2cell",
	bottom = 5,
}
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 1.1,
}
config.background = {
	{
		source = {
			Color = "#0f1419",
		},
		width = "100%",
		height = "100%",
		--opacity = 0.95
		opacity = 1,
	},
}

local backgrounds = {
	{
		source = {
			File = { path = wezterm.home_dir .. "/.config/wezterm/backgrounds/rivendell.gif", speed = 0.5 },
		},
		--	width = "100%",
		horizontal_align = "Center",
		vertical_align = "Middle",
		hsb = {
			hue = 1.0,
			saturation = 1.02,
			brightness = 0.30,
		},
		opacity = 0.25,
	},
	{
		source = {
			File = { path = wezterm.home_dir .. "/.config/wezterm/backgrounds/shire.gif", speed = 0.7 },
		},
		--	width = "100%",
		horizontal_align = "Center",
		vertical_align = "Middle",
		hsb = {
			hue = 1.0,
			saturation = 1.02,
			brightness = 0.30,
		},
		opacity = 0.25,
	},
}

math.randomseed(os.time())
local random_background = math.random(1, #backgrounds)
table.insert(config.background, backgrounds[random_background])

config.window_close_confirmation = "NeverPrompt"
config.macos_window_background_blur = 10
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
return config
