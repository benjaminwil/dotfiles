local wezterm = require 'wezterm'
local colors = {}

colors.dark_scheme = 'Atlas (base16)'
-- colors.light_scheme = 'Mexico Light (base16)'
colors.light_scheme = 'Cupertino (base16)'

function colors.ansi(number)
  local ansi_color_code = number + 1
  local current_color_scheme =
    wezterm.color.get_builtin_schemes()[colors.scheme()]

  return current_color_scheme["ansi"][ansi_color_code]
end

function colors.scheme()
  if wezterm.gui.get_appearance():find 'Dark' then
    return colors.dark_scheme
  else
    return colors.light_scheme
  end
end

colors.settings = {
  tab_bar = {
    active_tab = 'transparent',
    inactive_tab_edge = 'transparent',

    active_tab = {
      bg_color = 'transparent',
      fg_color = colors.ansi(3),
    },
    inactive_tab = {
      bg_color = 'transparent',
      fg_color = colors.ansi(7),
    },
    inactive_tab_hover = {
      bg_color = 'transparent',
      fg_color = colors.ansi(4),
    },
  },
}

return colors
