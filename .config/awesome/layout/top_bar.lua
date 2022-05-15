local awful = require('awful')
local naughty = require('naughty')
local helpers = require('helpers')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require("beautiful.xresources").apply_dpi

-- System-icon
local awesome_icon = require("layout.items.sys")
-- Date
local date_pill = require('layout.items.date')
 -- Clock
local time_pill = require('layout.items.time')
-- Musicplayer
--local playerctl_bar = require('layout.items.music')
-- Battery
local battery_pill = require('layout.items.battery')
-- RAM Usage
local mem_pill = require('layout.items.mem')
-- CPU Usage
local cpu_pill = require('layout.items.cpu')
-- Power off menu
local power_pill = require('layout.items.power')
-- Systray

local mysystray = wibox.widget.systray()

local mysystray_container = {
    mysystray,
    left = dpi(8),
    right = dpi(8),
    widget = wibox.container.margin
}

-- Only show name of the focused client
--local showFocused = function (self, c)
--  if c.active then
--    self:get_children_by_id('task_text')[1].markup = "<span foreground='" .. beautiful.tasklist_fg_focus .. "'>" .. c.name .. "</span>"
--  else
--    self:get_children_by_id('task_text')[1].markup = ""
--  end
--end

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
        bottom = dpi(5),
        left = dpi(3),
        right = dpi(3),
        top = dpi(5),
        layout = wibox.container.margin
    },
    bg = beautiful.xcolor8,
    shape = helpers.rrect(10),
    widget = wibox.container.background
} local wrap_widget = function(w) local wrapped = wibox.widget {
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
    --gears.wallpaper.set(beautiful.wallpaper_self, s, true)
    awful.wallpaper {
      screen = s,
      widget = {
        {
          image = beautiful.wallpaper_self,
          resize = true,
          widget = wibox.widget.imagebox
        },
      valign = "center",
      halign = "center",
      tiled = false,
      widget = wibox.container.tile
      },
    }

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox =awful.widget.layoutbox(s)

    if s.mywibox then
      s.mywibox:remove()
    end

    s.mywibox = awful.wibar({
            position = "top",
            height = dpi(38),
            screen = s,
            type = "dock",
            ontop = false,
        })

    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.noempty , awful.util.taglist_buttons)

    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        bg = beautiful.wibar_bg,
        style = {
            bg = beautiful.xcolor2,
            shape = helpers.rrect(10),
        },
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
                widget = wibox.container.background,
                --update_callback = showFocused,
                --create_callback = showFocused
            }
    }


    if s == screen.primary then
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
                        --wrap_widget(make_pill(playerctl_bar, beautiful.xcolor8)),
                        --wrap_widget(make_pill(battery_pill, beautiful.xcolor8)),
                        --wrap_widget(make_pill(cpu_pill, beautiful.xcolor8)),
                        --wrap_widget(make_pill(mem_pill, beautiful.xcolor8)),
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
                        wrap_widget(make_pill(power_pill, beautiful.xcolor8)),
                        helpers.horizontal_pad(4),
                        layout = wibox.layout.fixed.horizontal,
                    }
                },
                widget = wibox.container.background,
            }
        }
    else
        s.mywibox:setup {
            layout = wibox.layout.align.vertical,
            ontop = true,
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
                        layout = wibox.layout.fixed.horizontal
                    }
                },
                widget = wibox.container.background,
            }
        }
    end
end

screen.connect_signal("primary_changed", top_panel)

return top_panel
