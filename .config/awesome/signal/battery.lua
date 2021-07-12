local awful = require('awful')
local gears = require('gears')

batteryStatus = ""
batteryPercentage = 0

local getBatteryPercentage = function (batteryStatus)
   return awful.spawn.easy_async_with_shell(
        "upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | tr -d '%'",
        function (stdout)
            batteryPercentage = tonumber(stdout)
            awesome.emit_signal("signal::battery", batteryStatus, batteryPercentage)
        end
       )
end

local getBatteryStatus = function ()
   return awful.spawn.easy_async_with_shell(
        "upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}' | tr -d ''",
        function (stdout)
            batteryStatus = stdout:gsub('%\n', '')
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
