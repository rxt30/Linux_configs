local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local helpers = require("helpers")
local gears = require("gears")
local wibox = require("wibox")

local tasklist_buttons = gears.table.join(awful.button({}, 1, function(c)
  if c == client.focus then
    c.minimized = true
  else
    c:emit_signal("request::activate", "tasklist", { raise = true })
  end
end))

return function(s)
  local tasklist = awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    bg = beautiful.wibar_bg,
    style = {
      shape = gears.shape.rounded_bar,
    },
    layout = {
      spacing = dpi(8),
      layout = wibox.layout.fixed.horizontal,
    },
    widget_template = {
      {
        {
          {
            {
              id = "icon_role",
              forced_height = 16,
              forced_width = 16,
              resize = true,
              widget = wibox.widget.imagebox,
            },
            margins = 6,
            widget = wibox.container.margin,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left = dpi(10),
        right = dpi(10),
        widget = wibox.container.margin,
      },
      id = "background_role",
      widget = wibox.container.background,
    },
  })
  return tasklist
end
