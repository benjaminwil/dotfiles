local outer_border_width = '0.2cell'
local window_frame = {}

window_frame.width = '0.25cell'
window_frame.settings = {
  active_titlebar_bg = 'transparent',
  inactive_titlebar_bg = 'transparent',

  border_left_width = window_frame.width,
  border_right_width = window_frame.width,
  border_top_height = window_frame.width,
  border_bottom_height = 0,

  border_left_color = 'transparent',
  border_right_color = 'transparent',
  border_top_color = 'transparent',
}

return window_frame
