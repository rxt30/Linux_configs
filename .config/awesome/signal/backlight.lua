local awful = require("awful")
local gears = require("gears")

local getCurrentBackLight = function()
  awful.spawn.easy_async_with_shell("light", function(stdout)
    local currentVolume = math.floor(tonumber(stdout))
    awesome.emit_signal("signal::backlight", currentVolume)
  end)
end

local backlight_timer = gears.timer({
  timeout = 0.1,
  autostart = true,
  call_now = true,
  callback = getCurrentBackLight,
})

return backlight_timer
