local awful = require('awful')

local modkey = 'Mod1'

local client_buttons = awful.util.table.join(

    awful.button(
        {},
        1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end
        )
    )

return client_buttons
