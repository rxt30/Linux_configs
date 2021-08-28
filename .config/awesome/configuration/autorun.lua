local awful = require('awful')
local autoRunApps = {
    "nm-applet",
    --"picom -b --experimental-backends --dbus"
    "useless"
}

for i, app in ipairs(autoRunApps) do
    awful.spawn.easy_async_with_shell(app)
end
