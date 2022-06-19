local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local helpers = require("helpers")
local gears = require("gears")
local wibox = require("wibox")

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal("request::activate", "tasklist", {raise=true})
    end
  end
  ) 
)

function get_tasklist(s)
  local tasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    bg = beautiful.wibar_bg,
    style = {
      bg = beautiful.xcolor2,
      shape = helpers.rrect(10)
    },
    layout = {
      spacing = dpi(8),
      layout = wibox.layout.fixed.horizontal
    },
    widget_template = {
      {
        {
          {
            {
              id = "icon_role",
              widget = wibox.widget.imagebox
            },
            margins = 2,
            widget = wibox.container.margin
          },
          helpers.horizontal_pad(6),
          {
            id = 'text_role',
            widget = wibox.widget.textbox
          },
          layout = wibox.layout.fixed.horizontal
        },
        left = dpi(10),
        right = dpi(10),
        widget = wibox.container.margin
      },
      id = 'background_role',
      widget = wibox.container.background
    }
  }
  return tasklist
end

return get_tasklist
