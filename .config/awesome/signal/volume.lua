local awful = require("awful")
local gears = require("gears")

local getCurrentVolume = function()
  awful.spawn.easy_async_with_shell("pamixer --get-volume", function(stdout)
    local currentVolume = tonumber(stdout)
    awesome.emit_signal("signal::volume", currentVolume)
  end)
  awful.spawn.easy_async_with_shell("pamixer --get-mute", function(stdout)
    awesome.emit_signal("signal::mute", stdout)
  end)
end

local volume_timer = gears.timer({
  timeout = 5,
  autostart = true,
  call_now = true,
  callback = getCurrentVolume,
})

return volume_timer
