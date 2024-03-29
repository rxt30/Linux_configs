local beautiful = require("beautiful")
local dbus = require("lgi")
-- local bla = dbus.GDBus
local awful = require("awful")
require("awful.autofocus")
-- local naughty = require("naughty")
local gears = require("gears")

awful.util.shell = "sh"
awful.util.terminal = "kitty"

beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/powerarrow-dark/theme.lua")
local nice = require("nice")
nice()

require("configuration.autorun")
require("ui")
-- Configurations
require("configuration.keys")
require("configuration.client")
require("modules.exit-screen")

-- Start picom for transparent terminal windows
--awful.spawn.easy_async_with_shell('picom -b --experimental-backends --dbus')
--bling.signal.playerctl.enable{
--    backend = "playerctl_lib",
--    ignore = "firefox"
--}

-- if awesome.startup_errors then
--   naughty.notify({
--     preset = naughty.config.presets.critical,
--     title = "Error",
--     text = awesome.startup_errors,
--   })
-- end

-- do
--   local in_error = false
--   awesome.connect_signal("debug::error", function(err)
--     if in_error then
--       return
--     end
--     in_error = true
--
--     naughty.notify({
--       preset = naughty.config.presets.critical,
--       title = "Error",
--       text = tostring(err),
--     })
--
--     in_error = false
--   end)
-- end
