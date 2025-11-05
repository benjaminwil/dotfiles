local wezterm = require 'wezterm'

local colors = require '.colors'
local formats = require '.formats'
local keys = require '.keys'
local window_frame = require '.window_frame'

local config = {}

wezterm.on('format-tab-title', formats.tab_title)
wezterm.on('format-window-title', formats.window_title)

local font = {
  normal = wezterm.font({
    family = 'JetBrains Mono',
    weight = 'Regular',
  }),
  bold = wezterm.font({
    family = 'JetBrains Mono',
    weight = 'Medium',
  }),
  size = 12
}

config.adjust_window_size_when_changing_font_size = false

config.audible_bell = 'Disabled'

config.colors = colors.settings
config.color_scheme = colors.scheme()

config.default_cursor_style = 'BlinkingBlock'

config.font = font.normal
config.font_rules = {
  {
    intensity = 'Bold',
    font = font.bold
  },
}
config.font_size = font.size

config.hide_tab_bar_if_only_one_tab = true

config.inactive_pane_hsb = {
  saturation = 1,
  brightness = 1,
}

config.keys = keys.bindings

config.line_height = 1.05

config.native_macos_fullscreen_mode = true

-- Note that this configuration option is currently only available in the
-- nightly release.
--
config.show_close_tab_button_in_tabs = false

config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true

config.unzoom_on_switch_pane = true

config.use_ime = true
config.use_dead_keys = true

config.window_frame = window_frame.settings
config.window_frame.font = font.normal
config.window_frame.font_size = font.size - 2

--config.debug_key_events = true

config.window_padding = {
  bottom = 0,
}

return config
