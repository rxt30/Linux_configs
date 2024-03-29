local awful = require("awful")

local modkey = "Mod1"

local client_keys = awful.util.table.join(

  awful.key({ modkey }, "f", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = "toggle fullscreen", group = "screen" }),

  awful.key({ modkey, "Shift" }, "f", function(c)
    c.fullscreen = not c.fullscreen
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

return client_keys
