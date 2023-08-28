local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
        config = wezterm.config_builder()
end

config.default_prog = { "wsl.exe", "--distribution", "MyUbuntu", "--cd", "~" }

-- font
config.font = wezterm.font("DejaVuSansM Nerd Font Mono", { weight = "Regular" })
config.warn_about_missing_glyphs = false
config.adjust_window_size_when_changing_font_size = false

-- color scheme
config.color_scheme = "Nord"

-- background
config.window_background_opacity = 0.75
config.text_background_opacity = 0.75
config.window_background_image_hsb = {
        brightness = 0.15,
        saturation = 1.0,
}
-- config.window_background_image = "D:\\Desktop\\twitter\\zzz_zhihe_20230329135244_FsZF2aRakAUJhY8.jpg"

-- tab bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.colors = {
        tab_bar = {
                background = "#1b1f2f",
                active_tab = {
                        bg_color = "#444b71",
                        fg_color = "#c6c8d1",
                        intensity = "Normal",
                        underline = "None",
                        italic = false,
                        strikethrough = false,
                },
                inactive_tab = {
                        bg_color = "#282d3e",
                        fg_color = "#c6c8d1",
                        intensity = "Normal",
                        underline = "None",
                        italic = false,
                        strikethrough = false,
                },
                inactive_tab_hover = {
                        bg_color = "#1b1f2f",
                        fg_color = "#c6c8d1",
                        intensity = "Normal",
                        underline = "None",
                        italic = true,
                        strikethrough = false,
                },
                new_tab = {
                        bg_color = "#1b1f2f",
                        fg_color = "#c6c8d1",
                        italic = false,
                },
                new_tab_hover = {
                        bg_color = "#444b71",
                        fg_color = "#c6c8d1",
                        italic = false,
                },
        },
}

config.keys = {
        {
                key = "e",
                mods = "CTRL|SHIFT",
                action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        {
                key = "o",
                mods = "CTRL|SHIFT",
                action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
}

return config
