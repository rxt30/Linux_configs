local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local gears = require('gears')
local wibox = require('wibox')

local battery_timer = require('signal.battery')
battery_timer:start()

local battery_text = wibox.widget {
    font = beautiful.font,
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local battery_icon = wibox.widget {
    image = beautiful.battery,
    resize = true,
    widget = wibox.widget.imagebox
}

local battery_pill = wibox.widget {
    {
        {
            battery_icon,
            top = dpi(5),
            left = dpi(5),
            right = dpi(5),
            bottom = dpi(5),
            widget = wibox.container.margin
        },
        {
            {
                battery_text,
                expand = "outside",
                layout = wibox.layout.align.vertical
            },
            top = dpi(1),
            left = dpi(10),
            right = dpi(10),
            widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
    },
    left = dpi(10),
    right = dpi(13),
    widget = wibox.container.margin,
    visible = false
}

local setCharging = function (batteryPercentage)
   if batteryPercentage > 0 and batteryPercentage < 20 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_charging_10)
   elseif batteryPercentage >= 20 and batteryPercentage < 30 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_charging_20)
   elseif batteryPercentage >= 30 and batteryPercentage < 50 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_charging_50)
   elseif batteryPercentage >= 50 and batteryPercentage < 60 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_charging_60)
   elseif batteryPercentage >= 60 and batteryPercentage < 90 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_charging_80)
   elseif batteryPercentage >= 90 and batteryPercentage < 100 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_charging_90)
   end
end

local setDischarging = function (batteryPercentage)
   if batteryPercentage > 0 and batteryPercentage < 5 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_alert_red)
   elseif batteryPercentage >= 5 and batteryPercentage < 10 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_alert)
   elseif batteryPercentage >= 10 and batteryPercentage < 30 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_discharging_20)
   elseif batteryPercentage >= 30 and batteryPercentage < 50 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_discharging_30)
   elseif batteryPercentage >= 50 and batteryPercentage < 60 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_discharging_50)
   elseif batteryPercentage >= 60 and batteryPercentage < 80 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_discharging_60)
   elseif batteryPercentage >= 80 and batteryPercentage < 90 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_discharging_80)
   elseif batteryPercentage >= 90 and batteryPercentage < 95 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_discharging_90)
   elseif batteryPercentage >= 95 and batteryPercentage < 100 then
       battery_icon.image = gears.surface.load_uncached(beautiful.battery_discharging_100)
   end
end

awesome.connect_signal("signal::battery",
    function (batteryStatus, batteryPercentage)
        if batteryStatus == "charging" then
            setCharging(batteryPercentage)
            battery_pill.visible = true
        elseif batteryStatus == "discharging" then
            setDischarging(batteryPercentage)
            battery_pill.visible = true
        elseif batteryStatus == "fully-charged" or batteryPercentage == 100 then
            battery_icon.image = gears.surface.load_uncached(beautiful.battery_fully_charged)
            battery_pill.visible = true
        else
            battery_icon.image = gears.surface.load_uncached(beautiful.battery_alert_red)
            battery_pill.visible = false
            return
        end
        battery_text.markup = "<span foreground='" .. beautiful.xcolor8 .. "'>" ..
                              string.format("%1d", batteryPercentage) .. "%" .. "</span>"
    end
    )

return battery_pill
