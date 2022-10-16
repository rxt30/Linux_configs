local awful = require("awful")
local autoRunApps = {
  "autorandr --change",
  "setxkbmap -option caps:escape -layout de",
  "xset -b",
  "xset r rate 200 30",
  "xset s 600",
  "nm-applet",
  "dunst",
}

for i, app in ipairs(autoRunApps) do
  awful.spawn.easy_async_with_shell(app)
end
