local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local launch_menu = {}
local keys = {}

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

table.insert(keys, {
	key = "n",
	mods = "CTRL|SHIFT",
	action = act.ShowLauncher,
})

for i = 1, 8 do
	-- ALT + number to activate that tab
	table.insert(keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end
table.insert(keys, {
	key = " ",
	mods = "CTRL|SHIFT",
	action = act.ActivateTabRelative(-1),
})
table.insert(keys, {
	key = " ",
	mods = "CTRL",
	action = act.ActivateTabRelative(1),
})

return {
	default_prog = { "zsh" },
	launch_menu = launch_menu,

	keys = keys,

	automatically_reload_config = true,

	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",

	enable_tab_bar = true,
	font = wezterm.font_with_fallback({ "Maple Mono NF CN", "Noto Sans Mono", "NanumGothicCoding" }),
	font_size = 16,
	default_cursor_style = "BlinkingBar",

	window_background_opacity = 0.7,

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
