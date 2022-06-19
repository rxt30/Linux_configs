local awful = require("awful")
local gears = require("gears")

local getCpuUsage = function()
  return awful.spawn.easy_async_with_shell(
    "top -bn1 | grep \"Cpu(s)\" | " .. "sed \"s/.*, *\\([0-9.]*\\)%* id.*/\\1/\" | " .. "awk '{print 100 - $1}'",
    function(stdout)
      local cpuUsage = tonumber(stdout)
      awesome.emit_signal("signal::cpu", cpuUsage)
    end
  )
end

local cpu_timer = gears.timer({
  timeout = 2,
  autostart = true,
  call_now = true,
  callback = getCpuUsage,
})

return cpu_timer
