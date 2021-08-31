local awful = require('awful')

local modkey = 'Mod1'

local client_buttons = awful.util.table.join(

    awful.button(
        {},
        1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end
        ),
    awful.button(
        { modkey },
        1,
        function (c)
          c:activate { context = "mouse_click", action = "mouse_move" }
        end
    ),
    awful.button(
        { modkey },
        3,
        function (c)
          c:activate { context = "mouse_click", action = "mouse_resize" }
        end
    )
)
return client_buttons
