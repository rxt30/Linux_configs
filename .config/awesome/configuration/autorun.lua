local awful = require('awful')
local autoRunApps = {
--    "nm-applet",
    --"picom -b --experimental-backends --dbus"
--    "pasystray",
--    "xfsettingsd",
--    "xfce4-power-manager",
      "lxqt-powermanagement",
      "lxqt-notificationd",
      "lxqt-policykit-agent",
      "lxqt-globalkeysd",
      "/usr/lib/disman_backend_launcher",
      "setxkbmap -option caps:escape -layout de",
      "nm-applet",
      "pasystray",
      "xscreensaver -no-splash",
      "xset -b"
}

for i, app in ipairs(autoRunApps) do
    awful.spawn.easy_async_with_shell(app)
end
