local awful = require('awful')
local gears = require('gears')


local getBatteryTimeRemaining = function (batteryStatus, batteryPercentage)
  return awful.spawn.easy_async_with_shell(
    "upower -i $(upower -e | grep BAT) | grep 'time to empty' | awk '{print $4\" \"$5}' | tr -d ''",
    function (stdout)
      local remainingTime = stdout
      awesome.emit_signal("signal::battery", batteryStatus, batteryPercentage, remainingTime)
    end
  )
end

local getBatteryPercentage = function (batteryStatus)
   return awful.spawn.easy_async_with_shell(
        "upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | tr -d '%'",
        function (stdout)
            local batteryPercentage = tonumber(stdout)
            getBatteryTimeRemaining(batteryStatus, batteryPercentage)
        end
       )
end

local getBatteryStatus = function ()
   return awful.spawn.easy_async_with_shell(
        "upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}' | tr -d ''",
        function (stdout)
            local batteryStatus = stdout:gsub('%\n', '')
            getBatteryPercentage(batteryStatus)
        end
       )
end


local battery_timer = gears.timer {
    timeout = 10,
    autostart = true,
    call_now = true,
    callback = getBatteryStatus
}

return battery_timer
