local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")
local wbutton = require("ui.widgets.button")

return function()
  local sys_icon = wibox.widget({
    {
      text = "",
      font = "Roboto Medium 25",
      widget = wibox.widget.textbox,
    },
    margin = dpi(5),
    widget = wibox.container.margin,
  })

  return wbutton.elevated.state({
    child = sys_icon,
    normal_bg = beautiful.wibar_bg,
    on_release = function()
      awesome.emit_signal("module::exit_screen:show")
    end,
  })
end
