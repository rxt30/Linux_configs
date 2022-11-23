local lgi = require("lgi")
local cairo, Gio, GLib, GObject = lgi.cairo, lgi.Gio, lgi.GLib, lgi.GObject

local dbus = { config = {} }
local bus_connection
