local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local gears = require("gears")
local wibox = require("wibox")

local backlight_timer = require("signal.backlight")
backlight_timer:start()

local backlight_text = wibox.widget({
  font = beautiful.font,
  text = "testh",
  align = "center",
  valign = "center",
  widget = wibox.widget.textbox,
})

local backlight_icon = wibox.widget({
  font = "Roboto 18",
  text = "",
  align = "center",
  valign = "center",
  forced_width = dpi(30),
  widget = wibox.widget.textbox,
})

local backlight_pill = wibox.widget({
  {
    {
      backlight_icon,
      top = dpi(1),
      right = dpi(1),
      left = dpi(1),
      bottom = dpi(1),
      widget = wibox.container.margin,
    },
    {
      {
        backlight_text,
        expand = "outside",
        layout = wibox.layout.align.vertical,
      },
      top = dpi(1),
      left = dpi(5),
      right = dpi(5),
      widget = wibox.container.margin,
    },
    layout = wibox.layout.fixed.horizontal,
  },
  left = dpi(10),
  right = dpi(10),
  widget = wibox.container.margin,
  visible = true,
})

awesome.connect_signal("signal::backlight", function(backlight)
  backlight_text.text = backlight .. " %"
end)

backlight_pill:buttons(gears.table.join(
  awful.button({}, 4, function()
    awful.spawn("light -A +5")
    backlight_timer:again()
  end),
  awful.button({}, 5, function()
    awful.spawn("light -U 5")
    backlight_timer:again()
  end)
))

return backlight_pill
