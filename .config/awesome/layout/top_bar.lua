local awful = require('awful')
local helpers = require('helpers')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require("beautiful.xresources").apply_dpi

-- System-icon
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

-- Date

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
 -- Clock

local time_text = wibox.widget {
   format = "%H:%M",
   align = "center",
   valign = "center",
   widget = wibox.widget.textclock,
   refresh = 1
}

time_text:connect_signal("widget::redraw_needed", function ()
        time_text.markup = "<span foreground='" .. beautiful.xcolor5 .. "'>" ..
                           time_text.text .. "</span>"
                       end)

local time_pill = wibox.widget {
    {
        {time_text, top = dpi(1), widget = wibox.container.margin},
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}

-- Musicplayer

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

-- Systray

local mysystray = wibox.widget.systray()

local mysystray_container = {
    mysystray,
    left = dpi(8),
    right = dpi(8),
    widget = wibox.container.margin
}

-- Tasklist Buttons

local tasklist_buttons = gears.table.join(
        awful.button({}, 1, function (c)
            if c == client.focus then
                c.minimized = true
            else 
                c:emit_signal("request::activate", "tasklist", {raise=true})
            end
        end)
    )

-- Panel bar
local final_systray = wibox.widget {
    {
        mysystray_container,
        top = dpi(6),
        left = dpi(3),
        right = dpi(3),
        layout = wibox.container.margin
    },
    bg = beautiful.xcolor8,
    shape = helpers.rrect(10),
    widget = wibox.container.background
}

local wrap_widget = function(w)
    local wrapped = wibox.widget {
        w,
        top = dpi(5),
        left = dpi(4),
        bottom = dpi(5),
        right = dpi(4),
        widget = wibox.container.margin
    }
    return wrapped
end

local make_pill = function(w, c)
    local pill = wibox.widget {
        w,
        bg = c or beautiful.xcolor0,
        shape = helpers.rrect(10),
        widget = wibox.container.background
    }
    return pill
end

local top_panel = function(s)
     
    local wallpaper = beautiful.wallpaper
    gears.wallpaper.maximized(wallpaper, s, true)

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox =awful.widget.layoutbox(s)

    s.mywibox = awful.wibar({
            position = "top",
            height = dpi(40),
            screen = s,
            type = "dock",
            ontop = true
        })

    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        bg = beautiful.wibar_bg,
        style = {bg = beautiful.xcolor2, shape = helpers.rrect(10)},
        layout = {
            spacing = dpi(8),
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget = wibox.container.margin
                    },
                    helpers.horizontal_pad(6),
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left = dpi(10),
                right = dpi(10),
                widget = wibox.container.margin
                },
                id = 'background_role',
                widget = wibox.container.background
            }
    }

    s.mywibox:setup {
        layout = wibox.layout.align.vertical,
        nil,
        {
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                {
                    layout = wibox.layout.fixed.horizontal,
                    helpers.horizontal_pad(4),
                    wrap_widget(
                        make_pill({
                                awesome_icon,
                            {
                                s.mytaglist,
                                helpers.horizontal_pad(4),
                                layout = wibox.layout.fixed.horizontal
                            },
                            spacing = 14,
                            spacing_widget = {
                                color = beautiful.xcolor8,
                                shape = gears.shape.powerline,
                                widget = wibox.widget.separator
                            },
                            layout = wibox.layout.fixed.horizontal
                            })),
                    s.mypromptbox,
                    wrap_widget(s.mytasklist)
                },
                nil,
                {
                    wrap_widget(make_pill(playerctl_bar, beautiful.xcolor8)),
                    wrap_widget(make_pill(time_pill, beautiful.xcolor0)),
                    wrap_widget(make_pill(date_pill, beautiful.xcolor0)),
                    wrap_widget(make_pill({
                        s.mylayoutbox,
                        top = dpi(7),
                        bottom = dpi(7),
                        right = dpi(7),
                        left = dpi(7),
                        widget = wibox.container.margin
                        }, beautiful.xcolor8)),
                    wrap_widget(make_pill(final_systray, beautiful.xcolor0)),
                    helpers.horizontal_pad(4),
                    layout = wibox.layout.fixed.horizontal
                }
            },
            widget = wibox.container.background,
        }
    }
end

return top_panel
