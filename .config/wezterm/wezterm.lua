local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)


return {
	default_prog = { "zsh" },

	automatically_reload_config = true,

  color_scheme = "Catppuccin Frappe",
  colors = { background = "black" },

	enable_tab_bar = false,
	font = wezterm.font_with_fallback({ "Maple Mono NF CN", "Noto Sans Mono", "NanumGothicCoding" }),
	font_size = 14,
	default_cursor_style = "BlinkingBar",

	window_background_opacity = 0.7,
  kde_window_background_blur = true,
	
	-- window_close_confirmation = "NeverPrompt",
	window_decorations = "NONE",
	-- window_decorations = "RESIZE",

	window_padding = {
		left = 6,
		right = 6,
		top = 6,
		bottom = 6,
	},

  enable_scroll_bar = true,
	-- alternate_buffer_wheel_scroll_speed = 1,

	mouse_bindings = {
	  {
	    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
	    mods = 'NONE',
	    action = wezterm.action.ScrollByLine(-2),
	  },
	  {
	    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
	    mods = 'NONE',
	    action = wezterm.action.ScrollByLine(2),
	  },
	  {
	    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
	    mods = 'SHIFT',
	    action = wezterm.action.SendKey {key = 'UpArrow', mods= 'NONE'},
	  },
	  {
	    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
	    mods = 'SHIFT',
	    action = wezterm.action.SendKey {key = 'DownArrow', mods= 'NONE'},
	  },
	}
}
