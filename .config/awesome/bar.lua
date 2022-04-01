local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local wallpaper = gears.filesystem.get_configuration_dir() .. "/wallpaper.png"

local tags = {
  {
    gap = 3,
    layout = awful.layout.suit.tile
  },
  {
    gap = 3,
    layout = awful.layout.suit.tile
  },
  {
    gap = 3,
    layout = awful.layout.suit.tile
  },
  {
    gap = 3,
    layout = awful.layout.suit.floating
  },
  {
    gap = 3,
    layout = awful.layout.suit.tile
  }
}

awful.screen.connect_for_each_screen(function(s)

  gears.wallpaper.maximized(wallpaper, s, true)

  for i, tag in pairs(tags) do
    awful.tag.add(
    i,
    {
      layout = tag.layout or awful.layout.suit.tile,
      gap_single_client = true,
      gap = dpi(2),
      screen = s,
      selected = i == 1
    }
    )
  end

  s.mypromptbox = awful.widget.prompt()
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
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
      awful.widget.keyboardlayout(),
      wibox.widget.systray(),
      s.mylayoutbox
    }
  }
end)
