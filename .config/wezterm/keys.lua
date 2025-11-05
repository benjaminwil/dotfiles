local wezterm = require 'wezterm'
local keys = {}

function keys.rename_tab_action()
  function rename_tab_callback(window, _pane, line)
    if line then
      window:active_tab():set_title(line)
    end
  end

  return wezterm.action.PromptInputLine {
    action = wezterm.action_callback(rename_tab_callback),
    description = 'Rename the current tab:',
  }
end

keys.bindings = {
  {
    key = 'I',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.CharSelect {
      copy_on_select = true,
      copy_to = 'ClipboardAndPrimarySelection',
    },
  },
  {
    key = 'D',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.ShowDebugOverlay
  },
  {
    key = 'R',
    mods = 'SUPER|SHIFT',
    action = keys.rename_tab_action()
  },
  {
    key = 'Z',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = '{',
    mods = 'ALT|SHIFT',
    action = wezterm.action.MoveTabRelative(-1)
  },
  {
    key = '}',
    mods = 'ALT|SHIFT',
    action = wezterm.action.MoveTabRelative(1)
  },
  {
    key = 'Enter',
    mods = 'SUPER',
    action = wezterm.action.SplitVertical
  },
  {
    key = 'Enter',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitHorizontal
  },
}

return keys
