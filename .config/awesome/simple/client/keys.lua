local awful = require("awful")
local gears = require("gears")

local modkey = "Mod1"
return gears.table.join(
  awful.key({ modkey }, "f", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = "toggle fullscreen", group = "screen" }),

  awful.key({ modkey }, "n", function(c)
    c.minimized = true
  end, { description = "minimize client", group = "screen" }),

  awful.key({ modkey }, "c", function(c)
    c.fullscreen = false
    c.maximized = false
    c.floating = not c.floating
    c:raise()
  end, { description = "toggle floating", group = "screen" }),

  awful.key({ modkey }, "q", function(c)
    c:kill()
  end, { description = "close application", group = "screen" }),

  awful.button({}, 1, function(c)
    c.emit_signal("request::activate", "mouse_click", { raise = true })
  end),

  awful.button({}, 1, function(c)
    c.emit_signal("request::activate", "mouse_click", { raise = true })
  end),

  awful.button({}, 1, function(c)
    c.emit_signal("request::activate", "mouse_click", { raise = true })
  end)
)
