local beautiful = require('beautiful')
local gears = require('gears')
local dpi = require('beautiful.xresources').apply_dpi
local wibox = require('wibox')

local song_art = wibox.widget {
    resize = true,
    widget = wibox.widget.imagebox
}


local song_title = wibox.widget {
    markup = "Nothing Playing",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local song_artist = wibox.widget {
    markup = "nothing playing",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local playerctl_bar = wibox.widget {
    {
        {
         song_art,
         top = dpi(5),
         left = dpi(5),
         right = dpi(5),
         bottom = dpi(5),
         widget = wibox.container.margin
        },
        {
            {
                song_title,
                expand = "outside",
                layout = wibox.layout.align.vertical
            },
            top = dpi(1),
            left = dpi(10),
            right = dpi(10),
            widget = wibox.container.margin
        },
        {
            {
                song_artist,
                expand = "outside",
                layout = wibox.layout.align.vertical
            },
            top = dpi(1),
            left = dpi(10),
            widget = wibox.container.margin
        },
        spacing = 1,
        spacing_widget = {
            bg = beautiful.xcolor8,
            shape = gears.shape.powerline,
            widget = wibox.container.background
        },
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(13),
    widget = wibox.container.margin
}

playerctl_bar.visible = false

awesome.connect_signal("bling::playerctl::no_players",
    function ()
        playerctl_bar.visible = false
    end)

awesome.connect_signal("bling::playerctl::title_artist_album",
    function (title, artist, art_path)
        playerctl_bar.visible = true
        song_title.markup = '<span foreground="' .. beautiful.xcolor5 .. '">' ..
                            title .. "</span>"
        song_artist.markup = '<span foreground="' .. beautiful.xcolor4 .. '">' ..
                            artist .. "</span>"
        song_art.image = gears.surface.load_uncached(art_path)
end)

return playerctl_bar
