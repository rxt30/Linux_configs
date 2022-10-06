local awful = require("awful")
local animation = require("modules.animation")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local naughty = require("naughty")
local ruled = require("ruled")
-- local widgets = require("ui.widgets")
local wibox = require("wibox")

-- naughty.persistence_enabled = true
-- naughty.config.defaults.ontop = true
-- naughty.config.defaults.timeout = 5
-- naughty.config.defaults.title = "System Notification"
-- naughty.config.defaults.position = "top_right"

ruled.notification.connect_signal("request::rules", function()
  ruled.notification.append_rule({
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    },
  })
end)

naughty.connect_signal("request::display", function(n)
  local accent_colors = "#9b9b9b"

  local app_name = wibox.widget({
    --size = 12,
    --bold = true,
    text = n.app_name,
    widget = wibox.widget.textbox,
    -- --   -- text = n.app_name,
  })

  local timeout_arc = wibox.widget({
    widget = wibox.container.arcchart,
    forced_width = dpi(26),
    forced_height = dpi(26),
    max_value = 100,
    min_value = 0,
    value = 0,
    thickness = dpi(4),
    rounded_edge = true,
    colors = {
      {
        type = "linear",
        from = { 0, 0 },
        to = { 400, 400 },
        stops = {
          { 0, accent_colors },
          { 0.2, accent_colors },
          { 0.4, accent_colors },
          { 0.6, accent_colors },
          { 0.8, accent_colors },
        },
      },
    },
  })
  --
  local title = wibox.widget({
    widget = wibox.container.scroll.horizontal,
    step_function = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
    fps = 60,
    speed = 75,
    wibox.widget({
      -- size = 11,
      -- bold = true,
      text = n.title,
      widget = wibox.widget.textbox,
    }),
  })
  --
  local message = wibox.widget({
    widget = wibox.container.scroll.horizontal,
    step_function = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
    fps = 60,
    speed = 75,
    wibox.widget({
      -- size = 11,
      text = n.message,
      widget = wibox.widget.textbox,
    }),
  })

  naughty.layout.box({
    notification = n,
    type = "notification",
    cursor = "hand2",
    shape = gears.shape.rectangle,
    minimum_width = dpi(200),
    minimum_height = dpi(100),
    maximum_width = dpi(350),
    maximum_height = dpi(180),
    position = "bottom_right",
    screen = screen.primary,
    widget_template = {
      {
        layout = wibox.layout.fixed.vertical,
        {
          {
            layout = wibox.layout.align.horizontal,
            app_name,
            nil,
            timeout_arc,
          },
          margins = { top = dpi(5), bottom = dpi(5), left = dpi(15), right = dpi(15) },
          widget = wibox.container.margin,
        },
        {
          {
            layout = wibox.layout.fixed.vertical,
            title,
            message,
          },
          margins = dpi(15),
          widget = wibox.container.margin,
        },
      },
      strategy = "max",
      widget = wibox.container.constraint,
    },
  })

  local anim = animation:new({
    duration = n.timeout,
    target = 100,
    easing = animation.easing.linear,
    reset_on_stop = false,
    update = function(self, pos)
      timeout_arc.value = pos
    end,
  })

  anim:start()
end)

-- naughty.connect_signal("request::display_error")

-- naughty.notify({ title = "Test", message = "Hello world", app_name = "Hello World" })
