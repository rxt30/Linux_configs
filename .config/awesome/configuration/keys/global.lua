local awful = require('awful')
local apps = require('configuration.apps')
local hotkeys_popup = require('awful.hotkeys_popup')

local modkey = 'Mod1'
local altkey = 'Mod4'

awful.keyboard.append_global_keybindings({

    --awful.key(
     --   {altkey},
      --  nil,
       -- hotkeys_popup.show_help,
        --{description = 'reload awesome', group = 'awesome'}
        --),
    awful.key(
        {modkey, 'Control'},
        'q',
        awesome.quit,
        {description = 'quit awesome', group = 'awesome'}
        ),

    awful.key(
        {modkey, 'Control'},
        'r',
        awesome.restart,
        {description = 'reload awesome', group = 'awesome'}
        ),

    awful.key(
        {modkey},
        'space',
        function()
            awful.layout.inc(1)
        end,
        {description = 'select next layout', group = 'layout'}
        ),

    awful.key(
        {modkey, 'Shift'},
        'h',
        function()
            awful.screen.focus_bydirection("left")
        end,
        { description = 'focus the previous screen', group = 'screen'}
        ),

    awful.key(
        {modkey, 'Shift'},
        'l',
        function()
            awful.screen.focus_bydirection("right")
        end,
        { description = 'focus the next screen', group = 'screen'}
        ),

    awful.key(
        {modkey},
        'Left',
        function()
            awful.client.swap.byidx(-1)
        end,
        { description = 'Swap client with the previous client', group = 'screen'}
        ),

    awful.key(
        {modkey},
        'Right',
        function()
            awful.client.swap.byidx(1)
        end,
        { description = 'Swap client with the next client', group = 'screen'}
        ),

    awful.key(
        {modkey},
        'h',
        function()
            awful.client.focus.bydirection("left")
        end,
        { description = 'focus previous by index', group = 'screen'}
        ),

    awful.key(
        {modkey},
        'j',
        function()
            awful.client.focus.bydirection("down")
        end,
        { description = 'focus next by index', group = 'screen'}
        ),

    awful.key(
        {modkey},
        'k',
        function()
            awful.client.focus.bydirection("up")
        end,
        { description = 'focus previous by index', group = 'screen'}
        ),

    awful.key(
        {modkey},
        'l',
        function()
            awful.client.focus.bydirection("right")
        end,
        { description = 'focus next by index', group = 'screen'}
        ),

    awful.key(
        {modkey},
        'c',
        function(c)
            c.fullscreen = false
            c.maximized = false
            c.floating = not c.floating
            c:raise()
        end,
        { description = 'toggle floating', group = 'screen'}
        ),

    awful.key(
        {altkey},
        'l',
        function()
            awful.spawn(apps.default.lock, false)
        end,
        { description = 'lock the screen', group = 'utility'}
        ),

    awful.key(
        {modkey},
        'Return',
        function()
            awful.spawn(apps.default.terminal)
        end,
        { description = 'open default terminal', group = 'launcher'}
        ),

    awful.key(
        {modkey},
        'e',
        function()
            awful.spawn(apps.default.file_manager)
        end,
        { description = 'open default file manager', group = 'launcher'}
        ),

    awful.key(
        {modkey},
        'b',
        function()
            awful.spawn(apps.default.web_browser)
        end,
        { description = 'open default web browser', group = 'launcher'}
        ),
    
    awful.key(
        {modkey},
        'p',
        function()
            awful.spawn(apps.default.launcher)
        end,
        { description = 'open default application search launcher', group = 'launcher'}
        ),

    awful.key(
        {modkey},
        's',
        function()
            awful.spawn(apps.default.settings)
        end,
        { description = 'open settings-manager', group = 'launcher'}
        ),

    awful.key(
        {modkey, 'Shift'},
        'Left',
        function()
            if client.focus then
                client.focus:move_to_screen(client.focus.screen.index - 1)
            end
        end
    ),

    awful.key(
        {modkey, 'Shift'},
        'Right',
        function()
            if client.focus then
                client.focus:move_to_screen(client.focus.screen.index + 1)
            end
        end
    ),

    awful.key(
        {modkey},
        'Tab',
        function()
            awful.client.cycle()
        end
    )
})

for i = 1, 9 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = {description = 'view tag #', group = 'tag'}
		descr_toggle = {description = 'toggle tag #', group = 'tag'}
		descr_move = {description = 'move focused client to tag #', group = 'tag'}
		descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
	end
	awful.keyboard.append_global_keybindings({
		-- View tag only.
		awful.key(
			{modkey},
			'#' .. i + 9,
			function()
				local focused = awful.screen.focused()
				local tag = focused.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			descr_view
		),
		-- Toggle tag display.
		awful.key(
			{modkey, 'Control'},
			'#' .. i + 9,
			function()
				local focused = awful.screen.focused()
				local tag = focused.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			descr_toggle
		),
		-- Move client to tag.
		awful.key(
			{modkey, 'Shift'},
			'#' .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
						tag:view_only()
					end
				end
			end,
			descr_move
		),
		-- Toggle tag on focused client.
		awful.key(
			{modkey, 'Control', 'Shift'},
			'#' .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			descr_toggle_focus
		)
    })
end

--return global_keys
