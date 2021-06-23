local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

client.connect_signal("request::titlebars", 
    function (c)
        local buttons = gears.table.join(
            awful.button({}, 1, function()
                c:emit_signal('request::activate', 'titlebar', {raise = true})
                awful.mouse.client.move(c)
            end)
            )
        awful.titlebar(c) : setup {
            layout = wibox.layout.align.horizontal,
            {
                awful.titlebar.widget.iconwidget(c),
                layout = wibox.layout.fixed.horizontal
            },
            {
                buttons = buttons,
                layout = wibox.layout.flex.horizontal
            },
            {
                awful.titlebar.widget.floatingbutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.stickybutton(c),
                awful.titlebar.widget.ontopbutton(c),
                awful.titlebar.widget.closebutton(c),
                layout = wibox.layout.fixed.horizontal
            }
        } 
    end
)
