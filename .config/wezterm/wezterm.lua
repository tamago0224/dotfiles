local wezterm = require("wezterm")

local config = {}

config.warn_about_missing_glyphs = false
config.font = wezterm.font("UDEV Gothic 35NF")
config.use_ime = true
config.font_size = 14.0
config.color_scheme = "Later This Evening"
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}
config.window_background_gradient = {
	colors = { "#000000" },
}
config.show_new_tab_button_in_tab_bar = false
-- config.show_close_tab_button_in_tabs = true
-- config.window_background_image = "/home/k-ohki/Pictures/barry_kun.png"
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.enable_wayland = false
config.leader = { key = "q", mods = "CTRL" }

-- keys mapping
config.keys = {
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = "~",
		}),
	},
	{
		key = "n",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnCommandInNewWindow({
			cwd = "~",
		}),
	},
	{
		mods = "LEADER",
		key = "s",
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
	},
}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

-- remove mailto rule.
config.hyperlink_rules = {
	-- Matches: a URL in parens: (URL)
	{
		regex = "\\((\\w+://\\S+)\\)",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in brackets: [URL]
	{
		regex = "\\[(\\w+://\\S+)\\]",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in curly braces: {URL}
	{
		regex = "\\{(\\w+://\\S+)\\}",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in angle brackets: <URL>
	{
		regex = "<(\\w+://\\S+)>",
		format = "$1",
		highlight = 1,
	},
	-- Then handle URLs not wrapped in brackets
	{
		regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
		format = "$0",
	},
}
config.default_cwd = "~"
config.colors = {
	split = "#008000",
	cursor_bg = "#FFFFFF",
	cursor_fg = "#ff00ff",
	tab_bar = {
		inactive_tab_edge = "none",
	},
}
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.4,
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle
wezterm.on("format-tab-title", function(tab, tabs, panes, _config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end
	local edge_foreground = background

	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- ssh host background
local host_to_color = {
	["*.thop.2iij.net"] = "#FF0000",
	-- key: pattern to match hostname,
	-- value: color to use as pane background for the hostname
}
local colored_panes = {}
wezterm.on("update-status", function(window, pane)
	local fg = pane:get_foreground_process_info() or {}
	if fg.name == "ssh" then
		for ndx = 2, #fg.argv do
			for k, v in pairs(host_to_color) do
				wezterm.log_info("hogehoge", k, v)
				if string.find(fg.argv[ndx], k) then
					if not colored_panes[pane:pane_id()] then
						pane:inject_output(string.format("\x1b]11;%s\x07", string.sub(v, 2)))
						colored_panes[pane:pane_id()] = fg.pid
					end
				end
			end
		end
	else
		if colored_panes[pane:pane_id()] then
			local ssh = wezterm.procinfo.get_info_for_pid(colored_panes[pane:pane_id()])
			if not ssh then
				colored_panes[pane:pane_id()] = nil
				pane:inject_output("\x1b]104\x07")
			end
		end
	end
end)

return config
