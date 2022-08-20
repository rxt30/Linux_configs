local awful = require("awful")
local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local helpers = require("helpers")

local function autostart_apps()
  --- Lockscreen & Display configuration
  awful.spawn.easy_async_with_shell("xlayoutdisplay")
  awful.spawn.easy_async_with_shell(
    "XSECURELOCK_PASSWORD_PROMPT=kaomoji XSECURELOCK_BLANK_TIMEOUT=5 XSECURELOCK_BLANK_DPMS_STATE=off xss-lock -l -- xsecurelock"
  )
  --- Compositor
  -- helpers.run.check_if_running("picom --experimental-backends", nil, function()
  -- awful.spawn("picom --experimental-backends --config " .. config_dir .. "configuration/picom.conf", false)
  -- end)
  --- Music Server
  helpers.run.run_once_pgrep("mpd")
  helpers.run.run_once_pgrep("mpDris2")
  --- Polkit Agent
  helpers.run.run_once_ps(
    "polkit-gnome-authentication-agent-1",
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
  )
  --- Other stuff
  helpers.run.run_once_grep("blueman-applet")
  helpers.run.run_once_grep("nm-applet")
  helpers.run.run_once_grep("xset r rate 200 30")
  helpers.run.run_once_grep("xset s 600")
  helpers.run.run_once_grep("lxqt-powermanagement")
  helpers.run.run_once_grep("setxkbmap -option caps:escape -layout de")
end

autostart_apps()
