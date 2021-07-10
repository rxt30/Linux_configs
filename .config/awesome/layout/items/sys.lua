local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local wibox = require('wibox')

local sys_icon = wibox.widget {
    widget = wibox.widget.imagebox,
    image = beautiful.system_icon,
    resize = true
}

local awesome_icon = wibox.widget {
    {
        sys_icon,
        top = dpi(5),
        bottom = dpi(5),
        left = dpi(10),
        right = dpi(5),
        widget = wibox.container.margin,
    },
    bg = beautiful.xcolor0,
    widget = wibox.container.background
}

return awesome_icon
