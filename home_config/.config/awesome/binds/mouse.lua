local awful = require("awful")
local gears = require("gears")

local launcher = require("../widgets/launcher")

local mouse_binds = {}
mouse_binds.root = gears.table.join(
	awful.button({}, 3, function()
		launcher.mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
)
-- {{{ Mouse bindings
return mouse_binds
-- }}}
