local awful = require("awful")
local gears = require("gears")

local getMemUsage = function()
  return awful.spawn.easy_async_with_shell("free -m | awk 'FNR==2{print $3}'", function(stdout)
    memUsage = tonumber(stdout)
    awesome.emit_signal("signal::memory", memUsage)
  end)
end

local mem_timer = gears.timer({
  timeout = 2,
  autostart = true,
  call_now = true,
  callback = getMemUsage,
})

return mem_timer
