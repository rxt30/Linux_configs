local awful = require("awful")
local gears = require("gears")

local getCurrentVolume = function()
  awful.spawn.easy_async_with_shell("pulsemixer --get-volume | sed 's/ .*//'", function(stdout)
    local currentVolume = tonumber(stdout)
    awesome.emit_signal("signal::volume", currentVolume)
  end)
  awful.spawn.easy_async_with_shell("pulsemixer --get-mute", function(stdout)
    local currentVolume = tonumber(stdout)
    awesome.emit_signal("signal::mute", currentVolume)
  end)
end

local volume_timer = gears.timer({
  timeout = 0.1,
  autostart = true,
  call_now = true,
  callback = getCurrentVolume,
})

return volume_timer
