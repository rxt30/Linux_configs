local awful = require 'awful'
local apps = require 'configuration.apps'
local gears = require 'gears'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local clickable_container = require 'modules.clickable-container'
local dpi = beautiful.xresources.apply_dpi
local icons_dir = beautiful.dir .. '/icons/'


local msg_table = {
  'Are you leawing me? qwq',
  'Ok bye'
}

local greeter_message = wibox.widget {
  markup = 'Choose wisely!',
  font = 'Inter UltraLight 48',
  align = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

local update_greeter_msg = function ()
  greeter_message.markup = msg_table[math.random(#msg_table)]
  greeter_message:emit_signal('widget::redraw_needed')
end

update_greeter_msg()

local build_power_button = function (name, icon, callback)
  local power_button_label = wibox.widget {
    text = name,
    font = 'Inter Regular 10',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }

  local power_button = wibox.widget {
    {
      {
        {
          {
            image = icon,
            widget = wibox.widget.imagebox
          },
          margins = dpi(16),
          widget = wibox.container.margin
        },
        bg = beautiful.xcolor0,
        widget = wibox.container.background
      },
      nil,
      shape = gears.shape.rounded_rect,
      forced_width = dpi(90),
      forced_height = dpi(90),
      widget = clickable_container
    },
    left = dpi(24),
    right = dpi(24),
    widget = wibox.container.margin
  }

  local exit_screen_item = wibox.widget {
    layout = wibox.layout.fixed.vertical,
    spacing = dpi(5),
    power_button,
    power_button_label
  }

  exit_screen_item:connect_signal(
    'button::release',
    function ()
      callback()
    end
  )

  return exit_screen_item
end

local suspend_command = function ()
  awesome.emit_signal('module::exit_screen:hide')
  awful.spawn.with_shell(apps.lock .. ' & systemctl suspend')
end

local logout_command = function ()
  awesome.quit()
end

local lock_command = function ()
  awesome.emit_signal('module::exit_screen:hide')
  awful.spawn.with_shell(apps.lock)
end

local poweroff_command = function ()
  awful.spawn.with_shell('poweroff')
  awesome.emit_signal('module::exit_screen:hide')
end

local reboot_command = function ()
  awful.spawn.with_shell('reboot')
  awesome.emit_signal('module::exit_screen:hide')
end

local poweroff = build_power_button('Shutdown', icons_dir .. 'power.svg', poweroff_command)
local reboot = build_power_button('Reboot', icons_dir .. 'restart.svg', reboot_command)
local suspend = build_power_button('Sleep', icons_dir .. 'power-sleep.svg', suspend_command)
local logout = build_power_button('Logout', icons_dir .. 'logout.svg', logout_command)
local lock = build_power_button('Lock', icons_dir .. 'lock.svg', lock_command)

local create_exit_screen = function (s)
  s.exit_screen = wibox {
    screen = s,
    type = 'splash',
    visible = false,
    ontop = true,
    bg = beautiful.bg_normal,
    fg = beautiful.fg_normal,
    height = s.geometry.height,
    width = s.geometry.width,
    x = s.geometry.x,
    y = s.geometry.y
  }

  s.exit_screen:buttons(
    gears.table.join(
      awful.button(
        {},
        2,
        function ()
          awesome.emit_signal('module::exit_screen:hide')
        end
      ),
      awful.button(
        {},
        3,
        function ()
          awesome.emit_signal('module::exit_screen:hide')
        end
      )
    )
  )

  s.exit_screen:setup {
    layout = wibox.layout.align.vertical,
    expand = 'none',
    nil,
    {
      layout = wibox.layout.align.vertical,
      {
        nil,
        {
          layout = wibox.layout.fixed.vertical,
          spacing = dpi(5),
          {
            layout = wibox.layout.align.vertical,
            expand = 'none',
            nil,
            {
              layout = wibox.layout.align.horizontal,
              expand = 'none',
            },
            nil
          },
          nil
        },
        nil,
        expand = 'none',
        layout = wibox.layout.align.horizontal
      },
      {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        nil,
        {
          widget = wibox.container.margin,
          margins = dpi(15),
          greeter_message
        },
        nil
      },
      {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        nil,
        {
          {
            {
              poweroff,
              reboot,
              suspend,
              logout,
              lock,
              layout = wibox.layout.fixed.horizontal
            },
            spacing = dpi(30),
            layout = wibox.layout.fixed.vertical
          },
          widget = wibox.container.margin,
          margins = dpi(15)
        },
        nil
      }
    },
    nil
  }
end

screen.connect_signal(
  'request::desktop_decoration',
  function (s)
    create_exit_screen(s)
  end
)

screen.connect_signal(
  'removed',
  function (s)
    create_exit_screen(s)
  end
)

awesome.connect_signal(
  'module::exit_screen:show',
  function ()
    for s in screen do
      s.exit_screen.visible = false
    end
    awful.screen.focused().exit_screen.visible = true
  end
)

awesome.connect_signal(
  'module::exit_screen:hide',
  function ()
    update_greeter_msg()
    for s in screen do
      s.exit_screen.visible = false
    end
  end
)
