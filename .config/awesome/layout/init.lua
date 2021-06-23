local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local dpi = beautiful.xresources.apply_dpi
local wibox = require('wibox')
local tag_creation = require('layout.tags')
local top_panel = require('layout.top_bar')
local theme = require('themes.powerarrow-dark.theme')

local l = awful.layout.suit

beautiful.wallpaper = gears.filesystem.get_configuration_dir() .. "/theme/wallpapers/bg.jpg"

awful.screen.connect_for_each_screen(function(s)

        tag_creation.create_tags(s)
        --top_panel(s)
        theme.at_screen_connect(s)

    end
)
