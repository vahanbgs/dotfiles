local wezterm = require 'wezterm'

return {
  automatically_reload_config = true,
  color_scheme = 'Catppuccin Mocha',
  default_cursor_style = 'SteadyBar',
  enable_tab_bar = false,
  font = wezterm.font {
    family = 'FiraCode Nerd Font',
    harfbuzz_features = {
      'cv06',
      'ss01',
      'ss03',
      'ss05',
      'zero',
    },
  },
  font_size = 16,
  window_decorations = "NONE",
  window_padding = {
    left = '0.5cell',
    right = '0.5cell',
    top = '0.25cell',
    bottom = '0.25cell',
  },
}
