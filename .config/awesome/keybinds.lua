-- In rc.lua
-- Ensure you have the necessary requires
local awful = require("awful")
local gears = require("gears")

-- Define your modkey (usually Mod4, the Super or Windows key)
local modkey = "Mod4"

default_keybinds = require("default_keybinds")
-- Key bindings
globalkeys = gears.table.join(
	default_keybinds,
	-- Existing keybindings here...

	-- Add new keybindings based on your Hyprland config
	-- Close active window
	awful.key({ modkey }, "c", function()
		awful.spawn("xdotool getactivewindow windowclose")
	end, { description = "close active window", group = "client" }),
	
	-- Launch file manager (pcmanfm)
	awful.key({ modkey }, "e", function()
		awful.spawn("pcmanfm")
	end, { description = "launch pcmanfm", group = "launcher" }),

	-- IntelliJ IDEA
	awful.key({ modkey }, "i", function()
		awful.spawn("intellij-idea-ultimate-edition")
	end, { description = "launch IntelliJ IDEA", group = "launcher" }),

	-- Launch application launcher (rofi)
	awful.key({ modkey }, "r", function()
		awful.spawn("rofi -show drun -show-icons -width 30 -lines 10")
	end, { description = "run prompt", group = "launcher" }),

	-- Launch nwg-bar
	awful.key({ modkey }, "x", function()
		awful.spawn("nwg-bar")
	end, { description = "launch nwg-bar", group = "launcher" }),

	-- Toggle night mode
	awful.key({ modkey }, "s", function()
		awful.spawn("sh arch/utils/night-mode.sh")
	end, { description = "toggle night mode", group = "custom" }),

	-- Launch vmware
	awful.key({ modkey }, "F8", function()
		awful.spawn("vmware")
	end, { description = "launch vmware", group = "launcher" }),

	-- Toggle swaync-client
	awful.key({ modkey, "Shift" }, "n", function()
		awful.spawn("swaync-client -t -sw")
	end, { description = "toggle swaync-client", group = "launcher" }),

	-- Launch cliphist with wofi and copy selection
	awful.key({ modkey, "Shift" }, "c", function()
		awful.spawn.with_shell("cliphist list | wofi --dmenu | cliphist decode | wl-copy")
	end, { description = "launch cliphist", group = "launcher" }),

	-- Launch Microsoft Edge
	awful.key({ modkey }, "F1", function()
		awful.spawn("microsoft-edge-stable")
	end, { description = "launch Microsoft Edge", group = "launcher" }),

	-- Launch Microsoft Edge in private mode
	awful.key({ modkey, "Mod1" }, "n", function()
		awful.spawn("microsoft-edge-stable --inprivate")
	end, { description = "launch Microsoft Edge in private mode", group = "launcher" }),

	-- Launch emote (for emoji)
	awful.key({ modkey, "Shift" }, "e", function()
		awful.spawn("emote")
	end, { description = "launch emote", group = "launcher" }),

	-- Launch Telegram
	awful.key({ modkey }, "t", function()
		awful.spawn("telegram-desktop")
	end, { description = "launch Telegram", group = "launcher" })
)

return globalkeys
