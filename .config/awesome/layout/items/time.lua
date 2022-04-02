local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local wibox = require('wibox')

local time_text = wibox.widget {
   format = "%H:%M",
   align = "center",
   valign = "center",
   widget = wibox.widget.textclock,
   refresh = 1
}

time_text:connect_signal("widget::redraw_needed", function ()
        time_text.markup = "<span foreground='" .. beautiful.xcolor5 .. "'>" ..
                           time_text.text .. "</span>"
                       end)

local time_pill = wibox.widget {
    {
        {time_text, top = dpi(1), widget = wibox.container.margin},
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}

return time_pill
