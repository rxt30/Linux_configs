local awful = require('awful')
local autoRunApps = {
--    "nm-applet",
    --"picom -b --experimental-backends --dbus"
--    "pasystray",
--    "xfsettingsd",
--    "xfce4-power-manager",
      "/usr/lib/disman_backend_launcher & dismanctl -o",
--      "xlayoutdisplay",
      "setxkbmap -option caps:escape -layout de",
      "xset -b",
      "xset r rate 200 30",
      "lxqt-powermanagement",
      "lxqt-notificationd",
      "lxqt-policykit-agent",
      "lxqt-globalkeysd",
      "nm-applet",
      "pasystray",
      "xscreensaver -no-splash",
--      "lxqt-config-monitor -l"
}

for i, app in ipairs(autoRunApps) do
    awful.spawn.easy_async_with_shell(app)
end
