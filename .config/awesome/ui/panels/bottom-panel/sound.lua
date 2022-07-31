local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local apps = require("configuration.apps")
local naughty = require("naughty")
local wbutton = require("ui.widgets.button")

local sound = wibox.widget({
  {
    id = "icon",
    text = "婢",
    align = "center",
    valign = "center",
    font = beautiful.icon_font .. "Round 18",
    widget = wibox.widget.textbox,
  },
  layout = wibox.layout.align.horizontal,
})

awesome.connect_signal("widget::volume:update", function(value)
  local audioVolume = tonumber(value)
  if audioVolume == 0 then
    sound.icon:set_text("ﱝ")
  elseif audioVolume < 33 then
    sound.icon:set_text("")
  elseif audioVolume < 66 then
    sound.icon:set_text("奔")
  else
    sound.icon:set_text("墳")
  end
end)

local widget = wbutton.elevated.state({
  child = sound,
  normal_bg = beautiful.wibar_bg,
  on_release = function()
    awful.spawn(apps.default.audio_manager, false)
  end,
  on_scroll_up = function()
    awful.spawn("pamixer -u -i 5", false)
    awesome.emit_signal("widget::volume")
    awesome.emit_signal("module::volume_osd:show", true)
  end,
  on_scroll_down = function()
    awful.spawn("pamixer -u -d 5", false)
    awesome.emit_signal("widget::volume")
    awesome.emit_signal("module::volume_osd:show", true)
  end,
  on_secondary_release = function()
    awful.spawn.easy_async("pamixer -t --get-mute", function(stdout, _)
      if string.lower(stdout) == "true" then
        sound.icon:set_text("ﱝ")
      else
        awesome.emit_signal("widget::volume")
        awesome.emit_signal("module::volume_osd:show", true)
      end
    end)
  end,
})

return widget
