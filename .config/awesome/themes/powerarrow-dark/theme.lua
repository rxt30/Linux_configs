--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark"
theme.wallpaper_self                            = theme.dir .. "/wall.jpg"
theme.font                                      = "Roboto 9"
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#EA6F81"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#1A1A1A"
theme.bg_focus                                  = "#313131"
theme.bg_urgent                                 = "#1A1A1A"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#CC9393"
theme.tasklist_fg_normal                        = "#ffffff"
theme.tasklist_fg_focus                         = "#009900"
theme.tasklist_bg_focus                         = "#29444a"
theme.tasklist_bg_normal                        = "#49242a"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(40)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.svg"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.svg"
theme.layout_max                                = theme.dir .. "/icons/max.svg"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.svg"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.svg"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.system_icon                               = theme.dir .. "/icons/anarchy.png"
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false

theme.battery_alert_red                         = theme.dir .. "/../../icons/battery-alert-red.svg"
theme.battery_alert                             = theme.dir .. "/../../icons/battery-alert.svg"
theme.battery_charging_10                       = theme.dir .. "/../../icons/battery-charging-10.svg"
theme.battery_charging_20                       = theme.dir .. "/../../icons/battery-charging-20.svg"
theme.battery_charging_30                       = theme.dir .. "/../../icons/battery-charging-30.svg"
theme.battery_charging_50                       = theme.dir .. "/../../icons/battery-charging-50.svg"
theme.battery_charging_60                       = theme.dir .. "/../../icons/battery-charging-60.svg"
theme.battery_charging_80                       = theme.dir .. "/../../icons/battery-charging-80.svg"
theme.battery_charging_90                       = theme.dir .. "/../../icons/battery-charging-90.svg"
theme.battery_discharging_20                    = theme.dir .. "/../../icons/battery-discharging-20.svg"
theme.battery_discharging_30                    = theme.dir .. "/../../icons/battery-discharging-30.svg"
theme.battery_discharging_50                    = theme.dir .. "/../../icons/battery-discharging-50.svg"
theme.battery_discharging_60                    = theme.dir .. "/../../icons/battery-discharging-60.svg"
theme.battery_discharging_80                    = theme.dir .. "/../../icons/battery-discharging-80.svg"
theme.battery_discharging_90                    = theme.dir .. "/../../icons/battery-discharging-90.svg"
theme.battery_discharging_100                   = theme.dir .. "/../../icons/battery-discharging-100.svg"
theme.battery_fully_charged                     = theme.dir .. "/../../icons/battery-fully-charged.svg"
theme.battery                                   = theme.dir .. "/../../icons/battery.svg"
theme.memory                                    = theme.dir .. "/../../icons/memory.svg"
theme.ram                                       = theme.dir .. "/../../icons/ram.png"

theme.xcolor0                                   = "#29343d"
theme.xcolor1                                   = "#f9929b"
theme.xcolor2                                   = "#7ed491"
theme.xcolor3                                   = "#fbdf90"
theme.xcolor4                                   = "#a3b8ef"
theme.xcolor5                                   = "#ffffff"
theme.xcolor6                                   = "#9ce5c0"
theme.xcolor7                                   = "#ffffff"
theme.xcolor8                                   = "#3b4b58"
theme.xcolor9                                   = "#fca2aa"
theme.xcolor10                                  = "#2b3b38"
theme.wibar_bg                                  = "#1a2026"
theme.bg_systray                                = theme.xcolor8 

theme.useless_gap                               = dpi(0)
theme.titlebar_close_button_focus               = theme.dir .. "/../../icons/stoplight/close_focus.svg"
theme.titlebar_close_button_normal              = theme.dir .. "/../../icons/stoplight/close_normal.svg"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/../../icons/stoplight/maximized_focus_active.svg"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/../../icons/stoplight/maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/../../icons/stoplight/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/../../icons/stoplight/maximized_normal_inactive.svg"
theme.titlebar_minimize_button_focus    = theme.dir .. "/../../icons/stoplight/minimize_focus.svg"
theme.titlebar_minimize_button_normal   = theme.dir .. "/../../icons/stoplight/minimize_normal.svg"


theme.titlebar_close_button_focus_hover         = theme.dir .. "/../../icons/stoplight/close_focus_hover.svg"
theme.titlebar_close_button_normal_hover        = theme.dir .. "/../../icons/stoplight/close_normal_hover.svg"
theme.titlebar_maximized_button_focus_active_hover    = theme.dir .. "/../../icons/stoplight/maximized_focus_active_hover.svg"
theme.titlebar_maximized_button_normal_active_hover   = theme.dir .. "/../../icons/stoplight/maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = theme.dir .. "/../../icons/stoplight/maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_inactive_hover = theme.dir .. "/../../icons/stoplight/maximized_normal_inactive_hover.svg"
theme.titlebar_minimize_button_focus_hover      = theme.dir .. "/../../icons/stoplight/minimize_focus_hover.svg"
theme.titlebar_minimize_button_normal_hover     = theme.dir .. "/../../icons/stoplight/minimize_normal_hover.svg"

return theme
