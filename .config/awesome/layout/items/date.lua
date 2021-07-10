local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local wibox = require('wibox')

local date_text = wibox.widget {
    format = "%d.%m.%y",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
}

local date_pill = wibox.widget {
    {
        {date_text, top = dpi(1), widget = wibox.container.margin},
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}

return date_pill
