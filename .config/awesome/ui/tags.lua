local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local apps = require("configuration.apps")

local M = {}

local tags = {
  {
    type = "internet",
    default_app = apps.default.web_browser,
    layout = awful.layout.suit.fair,
    gap = beautiful.useless_gap,
  },
  {
    type = "terminal",
    default_app = apps.default.terminal,
    layout = awful.layout.suit.fair,
    gap = beautiful.useless_gap,
  },
  {
    type = "code",
    layout = awful.layout.suit.fair,
    gap = beautiful.useless_gap,
  },
  {
    type = "games",
    gap = beautiful.useless_gap,
    layout = awful.layout.suit.fair,
  },
  {
    type = "sandbox",
    layout = awful.layout.suit.fair,
    gap = 0,
  },
  {
    type = "files",
    gap = beautiful.useless_gap,
    layout = awful.layout.suit.fair,
  },
  {
    type = "social",
    layout = awful.layout.suit.fair,
  },
  {
    type = "8",
    layout = awful.layout.suit.fair,
  },
  {
    type = "9",
    layout = awful.layout.suit.fair,
  },
}

-- Set tags layout
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    awful.layout.suit.max,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
  })
end)

-- Create tags for each screen
function M.create_tags(s)
  awful.layout.layouts = {
    awful.layout.suit.max,
    awful.layout.suit.tile,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
  }

  for i, tag in pairs(tags) do
    awful.tag.add(i, {
      icon = tag.icon,
      icon_size = dpi(1),
      --                icon_only = true,
      layout = tag.layout or awful.layout.suit.spiral.dwindle,
      gap_single_client = true,
      gap = dpi(2),
      screen = s,
      --default_app = tag.default_app,
      selected = i == 1,
    })
  end
end

local update_gap_and_shape = function(t)
  -- Get current tag layout
  local current_layout = awful.tag.getproperty(t, "layout")
  -- If the current layout is awful.layout.suit.max
  if current_layout == awful.layout.suit.max then
    -- Set clients gap to 0 and shape to rectangle if maximized
    t.gap = 0
    for _, c in ipairs(t:clients()) do
      if not c.floating or not c.round_corners or c.maximized or c.fullscreen then
        c.shape = beautiful.client_shape_rectangle
      else
        c.shape = beautiful.client_shape_rounded
      end
    end
  else
    t.gap = beautiful.useless_gap
    for _, c in ipairs(t:clients()) do
      if not c.round_corners or c.maximized or c.fullscreen then
        c.shape = beautiful.client_shape_rectangle
      else
        c.shape = beautiful.client_shape_rounded
      end
    end
  end
end

-- Change tag's client's shape and gap on change
--tag.connect_signal(
--	'property::layout',
--	function(t)
--		update_gap_and_shape(t)
--	end
--)

-- Change tag's client's shape and gap on move to tag
--tag.connect_signal(
--	'tagged',
--	function(t)
--		update_gap_and_shape(t)
--	end
--)

-- Focus on urgent clients
awful.tag.attached_connect_signal(s, "property::selected", function()
  local urgent_clients = function(c)
    return awful.rules.match(c, { urgent = true })
  end
  for c in awful.client.iterate(urgent_clients) do
    if c.first_tag == mouse.screen.selected_tag then
      c:emit_signal("request::activate")
      c:raise()
    end
  end
end)

return M
