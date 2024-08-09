local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
local gears = require("gears")

-- {{{ Wibar
local wibar = {}

local modkey = "Mod4"

-- {{{ Taglist
function wibar.createTaglist(s)
	-- Create a wibox for each screen and add it
	local taglist_buttons = gears.table.join(
		awful.button({}, 1, function(t)
			t:view_only()
		end),
		awful.button({ modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),
		awful.button({}, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
		awful.button({}, 4, function(t)
			awful.tag.viewnext(t.screen)
		end),
		awful.button({}, 5, function(t)
			awful.tag.viewprev(t.screen)
		end)
	)

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})
	return s.mytaglist
end
-- }}}

-- {{{ Tasklist
function wibar.createTaskList(s)
	local tasklist_buttons = gears.table.join(
		awful.button({}, 1, function(c)
			if c == client.focus then
				c.minimized = true
			else
				c:emit_signal("request::activate", "tasklist", { raise = true })
			end
		end),
		awful.button({}, 3, function()
			awful.menu.client_list({ theme = { width = 250 } })
		end),
		awful.button({}, 4, function()
			awful.client.focus.byidx(1)
		end),
		awful.button({}, 5, function()
			awful.client.focus.byidx(-1)
		end)
	)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	return s.mytasklist
end
-- }}}

function wibar.createWibox(s)
	-- declare widgets
	local widget = require("widgets")
	local mylauncher = widget.launcher
	-- local mylauncher = require("widgets.launcher")
	-- Keyboard map indicator and switcher
	local mykeyboardlayout = awful.widget.keyboardlayout()
	local volume_widget = require("awesome-wm-widgets.pactl-widget.volume")
	local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
	-- textclock widget
	local mytextclock = wibox.widget.textclock()

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	s.mytaglist = wibar.createTaglist(s)
	s.mytasklist = wibar.createTaskList(s)
	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			wibox.widget.systray(),
			volume_widget(),
			-- battery_widget(),
			mytextclock,
			s.mylayoutbox,
		},
	})
	return s.mywibox
end
return wibar
