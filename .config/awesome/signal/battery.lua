local awful = require('awful')
local gears = require('gears')

local getBatteryStatus = function ()
   return awful.spawn.easy_async_with_shell(
        [[sh -c "
        upower -i $(upower -e | grep BAT) | grep state | awk '{print \$2}' | td -d '\n'
        "]],
        function (stdout)
            return stdout:gsub('%\n', '')
        end
       )
end

local getBatteryPercentage = function ()
   return awful.spawn.easy_async_with_shell(
        [[sh -c "
        upower -i $(upower -e | grep BAT) | grep percentage | awk '{print \$2}' | td -d '\n%'
        "]],
        function (stdout)
            return tonumber(stdout)
        end
       )
end

local getBatteryInfo = function ()
   local batteryStatus = getBatteryStatus
   local batteryPercentage = getBatteryPercentage
   awesome.emit_signal("signal::battery", batteryStatus, batteryPercentage)
end

local battery_timer = gears.timer {
    timeout = 5,
    autostart = true,
    call_now = true,
    callback = getBatteryInfo
}

return battery_timer
