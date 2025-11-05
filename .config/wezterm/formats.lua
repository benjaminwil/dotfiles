local wezterm = require 'wezterm'
local formats = {}

local BASENAME_REGEX = '([^/]+)/*$'
local STATIC_WINDOW_TITLE = 'Terminal'
local TYPICAL_SHELL = 'bash'

function formats.tab_title(tab, _tabs, _panes, _config, _hover, _max_width)
  local title
  if string.len(tab.tab_title) > 0 then
    title = tab.tab_title
  else
    title = formats.title_from(tab.active_pane)
  end

  return { { Text = ' '  .. title .. ' ' } }
end

function formats.window_title(_tab, _pane, _tabs, _panes, _config)
  return STATIC_WINDOW_TITLE
end

function formats.title_from(pane_info)
  local process_name = pane_info.foreground_process_name:match(BASENAME_REGEX)

  if process_name == TYPICAL_SHELL then
    return wezterm.to_string(pane_info.current_working_dir):match(BASENAME_REGEX)
  else
    return process_name
  end
end

return formats
