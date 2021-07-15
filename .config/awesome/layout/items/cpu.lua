local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local naughty = require('naughty')
local gears = require('gears')
local wibox = require('wibox')

local cpu_timer = require('signal.cpu')
cpu_timer:start()

local cpu_text = wibox.widget {
    font = beautiful.font,
    text = "test",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local cpu_icon = wibox.widget {
    image = beautiful.memory,
    resize = true,
    widget = wibox.widget.imagebox
}


local cpu_pill = wibox.widget {
    {
        {
            cpu_icon,
            top = dpi(5),
            right = dpi(5),
            left = dpi(5),
            bottom = dpi(5),
            widget = wibox.container.margin
        },
        {
            {
                cpu_text,
                expand = "outside",
                layout = wibox.layout.align.vertical
            },
            top = dpi(1),
            left = dpi(5),
            right = dpi(5),
            widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin,
    visible = true
}

awesome.connect_signal("signal::cpu",
        function (cpuUsage)
            cpu_text.text = cpuUsage .. "%"
        end
    )

return cpu_pill
