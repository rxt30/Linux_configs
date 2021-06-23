local awful = require('awful')
local wibox = require('wibox')

local clock = wibox.widget.textclock()

local top_panel = function(s)

    s.mypromptbox = awful.widget.prompt(s)
    s.mylayoutbox = awful.widget.layoutbox(s)

    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags
    }

    s.mywibox = awful.wibar({ position = "top", screen = s})
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox
        },
        s.mytasklist,
        {
            layout = wibox.layout.fixed.horizontal,
            clock,
            s.mylayoutbox
        }
    }
end

return top_panel
