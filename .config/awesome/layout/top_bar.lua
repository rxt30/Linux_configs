local awful = require('awful')
local helpers = require('helpers')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require("beautiful.xresources").apply_dpi

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
   format = "%H:%M:%S",
   align = "center",
   valign = "center",
   widget = wibox.widget.textclock
}

local time_pill = wibox.widget {
    {
        {time_text, top = dpi(1), widget = wibox.container.margin},
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}

-- Systray

local mysystray = wibox.widget.systray()

local mysystray_container = {
    mysystray,
    left = dpi(8),
    right = dpi(8),
    widget = wibox.container.margin
}

-- Panel bar
local final_systray = wibox.widget {
    {
        mysystray_container,
        top = dpi(8),
        left = dpi(3),
        right = dpi(3),
        layout = wibox.container.margin
    },
    bg = beautiful.xcolor8,
    widget = wibox.container.background
}

local wrap_widget = function(w)
    local wrapped = wibox.widget {
        w,
        top = dpi(0),
        left = dpi(0),
        bottom = dpi(0),
        right = dpi(0),
        widget = wibox.container.margin
    }
    return wrapped
end

local make_pill = function(w, c)
    local pill = wibox.widget {
        w,
        bg = c or beautiful.xcolor0,
        widget = wibox.container.background
    }
    return pill
end

local top_panel = function(s)
     
    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox =awful.widget.layoutbox(s)

    s.mywibox = awful.wibar({
            position = "top",
            screen = s,
            type = "dock",
            ontop = true
        })

    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        bg = beautiful.wibar_bg,
        style = {bg = beautiful.xcolor0},
        layout = {
            spacing = dpi(0),
            spacing_widget = {
                bg = beautiful.xcolor8,
                widget = wibox.container.background
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        awful.widget.clienticon,
                        top = dpi(3),
                        bottom = dpi(3),
                        right = dpi (3),
                        layout = wibox.container.margin
                    },
                    helpers.horizontal_pad(6),
                    {id = 'text_role', widget = wibox.widget.textbox},
                    layout = wibox.layout.fixed.horizontal
                },
                top = dpi(5),
                bottom = dpi(5),
                left = dpi(10),
                right = dpi(10),
                widget = wibox.container.margin
            },
            id = "background_role",
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
                    
                    wrap_widget(
                        make_pill({
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
                },
                {
                    wrap_widget(s.mytasklist),
                    widget = wibox.container.constraint
                },
                {
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
                    layout = wibox.layout.fixed.horizontal
                }
            },
            widget = wibox.container.background,
        }
    }
end

return top_panel
