local awful = require("awful")
local autoRunApps = {
  --    "nm-applet",
  --"picom -b --experimental-backends --dbus"
  --    "pasystray",
  --    "xfsettingsd",
  --    "xfce4-power-manager",
  "autorandr --change",
  "setxkbmap -option caps:escape -layout de",
  "xset -b",
  "xset r rate 200 30",
  "xset s 600",
  "lxqt-powermanagement",
  --  "lxqt-notificationd",
  "lxqt-policykit-agent",
  "lxqt-globalkeysd",
  "nm-applet",
  "pasystray",
  "XSECURELOCK_PASSWORD_PROMPT=kaomoji XSECURELOCK_BLANK_TIMEOUT=5 XSECURELOCK_BLANK_DPMS_STATE=off xss-lock -l -- xsecurelock",
  --      "xscreensaver -no-splash",
  --      "/usr/lib/disman_backend_launcher & dismanctl -o",
  --      "lxqt-config-monitor -l"
}

for i, app in ipairs(autoRunApps) do
  awful.spawn.easy_async_with_shell(app)
end
