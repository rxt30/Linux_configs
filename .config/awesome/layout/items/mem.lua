local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local naughty = require('naughty')
local gears = require('gears')
local wibox = require('wibox')

local mem_timer = require('signal.mem')
mem_timer:start()

local mem_text = wibox.widget {
    font = beautiful.font,
    text = "test",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}


local mem_pill = wibox.widget {
    {
        {
            {
                mem_text,
                expand = "outside",
                layout = wibox.layout.align.vertical
            },
            top = dpi(1),
            left = dpi(10),
            right = dpi(10),
            widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
    },
    left = dpi(10),
    right = dpi(13),
    widget = wibox.container.margin,
    visible = true
}

awesome.connect_signal("signal::memory",
    function (memUsage)
        mem_text.text = memUsage .. " MB"
    end
    )

return mem_pill
