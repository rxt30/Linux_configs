local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local gears = require("gears")
local wibox = require("wibox")

local volume_timer = require("signal.volume")

volume_timer:start()

currentVolume = 0

local volume_text = wibox.widget({
  font = beautiful.font,
  text = "test",
  align = "center",
  valign = "center",
  widget = wibox.widget.textbox,
})

local volume_icon = wibox.widget({
  font = "Roboto 18",
  text = "墳",
  align = "center",
  valign = "center",
  forced_width = dpi(30),
  widget = wibox.widget.textbox,
})

local volume_pill = wibox.widget({
  {
    {
      volume_icon,
      top = dpi(1),
      right = dpi(1),
      left = dpi(1),
      bottom = dpi(1),
      widget = wibox.container.margin,
    },
    {
      {
        volume_text,
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

awesome.connect_signal("signal::volume", function(volume)
  currentVolume = volume
  volume_text.text = volume .. " %"
end)

awesome.connect_signal("signal::mute", function(mute)
  if string.find(mute, "true") then
    volume_icon.text = "婢"
  else
    volume_icon.text = "墳"
  end
end)

volume_pill:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.spawn("pavucontrol")
  end),
  awful.button({}, 2, function()
    awful.spawn.easy_async_with_shell("pamixer -t --get-mute", function(stdout)
      awesome.emit_signal("signal::mute", stdout)
    end)
  end),
  awful.button({}, 4, function()
    awful.spawn.easy_async_with_shell("pamixer -i 5 --get-volume", function(stdout)
      local currentVolume = tonumber(stdout)
      awesome.emit_signal("signal::volume", currentVolume)
    end)
  end),
  awful.button({}, 5, function()
    awful.spawn.easy_async_with_shell("pamixer -d 5 --get-volume", function(stdout)
      local currentVolume = tonumber(stdout)
      awesome.emit_signal("signal::volume", currentVolume)
    end)
  end)
))

return volume_pill
