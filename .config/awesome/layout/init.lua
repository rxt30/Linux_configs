local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local tag_creation = require('layout.tags')
local theme = require('themes.powerarrow-dark.theme')


beautiful.wallpaper = gears.filesystem.get_configuration_dir() .. "/theme/wallpapers/bg.jpg"

awful.util.taglist_buttons = gears.table.join(
    awful.button(
            {},
            1,
            function (t)
                t:view_only()
            end)
)

awful.util.tasklist_buttons = gears.table.join(
        awful.button(
            {},
            1,
            function (c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal(
                        "request::activate",
                        "tasklist",
                        {raise=true})
                end
            end)
)

awful.screen.connect_for_each_screen(function(s)

        tag_creation.create_tags(s)
        --top_panel(s)
        theme.at_screen_connect(s)

    end
)
