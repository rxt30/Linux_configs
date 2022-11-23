local wezterm = require("wezterm")

return {
  color_scheme = "Catppuccin Latte",
  -- color_scheme = "Catppuccin Latte",
  font = wezterm.font("Noto Sans Mono", { weight = "Regular" }),
  font_size = 10,
  enable_tab_bar = false,
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  },
}
