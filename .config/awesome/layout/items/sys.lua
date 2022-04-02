local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local wibox = require('wibox')
local clickable_container = require('modules.clickable-container')

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

local awesome_button = wibox.widget {
  awesome_icon,
  widget = clickable_container
}

awesome_button:connect_signal(
  'button::release',
  function ()
    awesome.emit_signal('module::exit_screen:show')
  end
)

return awesome_button
