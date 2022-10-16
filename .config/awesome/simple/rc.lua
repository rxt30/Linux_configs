local beautiful = require("beautiful")
local gears = require("gears")

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

require("ui")
require("autostart")
require("keys")
require("client")
