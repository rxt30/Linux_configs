local awful = require('awful')
local naughty = require('naughty')
local gears = require('gears')

batteryStatus = ""
batteryPercentage = 0

local getBatteryStatus = function ()
   return awful.spawn.easy_async_with_shell(
        "upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}' | tr -d ''",
        function (stdout)
            batteryStatus = stdout:gsub('%\n', '')
        end
       )
end

local getBatteryPercentage = function ()
   return awful.spawn.easy_async_with_shell(
        "upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | tr -d '%'",
        function (stdout)
            batteryPercentage = tonumber(stdout)
            naughty.notify({text = "test" .. batteryPercentage})
        end
       )
end

local getBatteryInfo = function ()
   -- naughty.notify({text = batteryStatus .. "+" .. batteryPercentage})
   awesome.emit_signal("signal::battery", batteryStatus, batteryPercentage)
end

local battery_timer = gears.timer {
    timeout = 10,
    autostart = true,
    call_now = true,
    callback = getBatteryInfo
}

return battery_timer
