local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local client_keys = require("configuration.client.keys")
local client_buttons = require("configuration.client.buttons")

awful.rules.rules = {
  {
    id = "global",
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      titlebars_enabled = true,
    },
  },

  {
    id = "round_clients",
    rule_any = {
      type = {
        "normal",
      },
    },
    except_any = {
      name = { "Discord Updater" },
    },
    properties = {
      --round_corner = true
      --shape = beautiful.client_shape_rounded
    },
  },

  {
    id = "titlebars",
    rule_any = {
      type = {
        "normal",
      },
    },
    properties = {
      titlebars_enabled = true,
    },
  },

  {
    id = "dialog",
    rule_any = {
      type = { "dialog" },
      name = { "Screenshot" },
    },
    properties = {
      titlebars_enabled = false,
      floating = true,
      above = true,
      skip_decoration = true,
      placement = awful.placement.centered,
    },
  },
  {
    id = "terminal",
    rule_any = {
      class = { "kitty", "Kitty", "wezterm", "Wezterm" },
    },
    properties = {
      titlebars_enabled = false,
    },
  },
  {
    id = "chromium",
    rule_any = {
      class = { "chromium", "Chromium" },
    },
    properties = {
      titlebars_enabled = true,
    },
  },
  {
    rule_any = {
      class = { "rofi", "Rofi" },
    },
    properties = {
      floating = true,
      titlebars_enabled = false,
      above = true,
    },
    callback = function(c)
      if c.name == "rofi -    Apps " then
        c.maximized_vertical = true
        --awful.placement.left(c)
      end
    end,
  },
  {
    id = "fullscreen",
    rule_any = {
      fullscreen = true,
    },
    properties = {
      titlebars_enabled = false,
    },
  },
  {
    rule_any = {
      class = {
        "Plasma-desktop",
        "Plasma",
        "plasmashell",
      },
    },
    properties = {
      floating = true,
      below = true,
      sticky = true,
    },
  },
  {
    rule_any = {
      class = "Desktop - Plasma",
    },
    properties = {
      hidden = true,
    },
  },
}

client.connect_signal("manage", function(c)
  --c.shape = gears.shape.rounded_rect
  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end
end)
