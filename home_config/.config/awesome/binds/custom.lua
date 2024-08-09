-- In rc.lua
-- Ensure you have the necessary requires
local awful = require("awful")
local gears = require("gears")

-- Define your modKey (usually Mod4, the Super or Windows key)
local modKey = "Mod4"
local shiftKey = "Shift"
local altKey = "Mod1"

local custom_keybinds = gears.table.join(
	-- Existing keybindings here...

	-- Add new keybindings based on your Hyprland config
	-- Close active window
	awful.key({ modKey }, "Return", function()
		awful.spawn("alacritty")
	end, { description = "Launch Terminal", group = "launcher" }),
	-- awful.key({ modKey }, "c", function()
	-- 	awful.spawn("xdotool getactivewindow windowclose")
	-- end, { description = "close active window", group = "client" }),

	-- Launch file manager (pcmanfm)
	awful.key({ modKey }, "e", function()
		awful.spawn("pcmanfm")
	end, { description = "launch pcmanfm", group = "launcher" }),

	-- IntelliJ IDEA
	-- if hostname == "arch-vtp" then launch IntelliJ IDEA Ultimate Edition
	-- else launch IntelliJ Gateway
	awful.key({ modKey }, "i", function()
		awful.spawn("intelij-idea-ultimate-edition")
	end, { description = "launch IntelliJ IDEA", group = "launcher" }),

	-- Launch application launcher (rofi)
	awful.key({ modKey }, "r", function()
		awful.spawn("rofi -show drun -show-icons -width 30 -lines 10")
	end, { description = "run prompt", group = "launcher" }),

	-- Launch nwg-bar
	awful.key({ modKey }, "x", function()
		awful.spawn("nwg-bar")
	end, { description = "launch nwg-bar", group = "launcher" }),

	-- -- Toggle night mode
	-- awful.key({ modKey, "Shift" }, "s", function()
	-- 	awful.spawn("sh arch/utils/night-mode.sh")
	-- end, { description = "toggle night mode", group = "custom" }),

	-- Launch vmware
	awful.key({ modKey }, "F8", function()
		awful.spawn("vmware")
	end, { description = "launch vmware", group = "launcher" }),

	-- Toggle notification center
	awful.key({ modKey, "Shift" }, "n", function()
		awful.spawn("swaync-client -t -sw")
	end, { description = "toggle notification center", group = "launcher" }),

	awful.key({ modKey, "Shift" }, "c", function()
		awful.spawn.with_shell("copyq")
	end, { description = "launch clipboard manager", group = "launcher" }),

	-- Launch Microsoft Edge
	awful.key({ modKey }, "F1", function()
		awful.spawn("microsoft-edge-stable")
	end, { description = "launch Microsoft Edge", group = "launcher" }),

	-- Launch Microsoft Edge in private mode
	awful.key({ modKey, altKey }, "n", function()
		awful.spawn("microsoft-edge-stable --inprivate")
	end, { description = "launch Microsoft Edge in private mode", group = "launcher" }),

	-- Launch emote (for emoji)
	awful.key({ modKey, "Shift" }, "e", function()
		awful.spawn("emote")
	end, { description = "launch emote", group = "launcher" }),

	-- Launch Telegram
	awful.key({ modKey }, "t", function()
		awful.spawn("telegram-desktop")
	end, { description = "launch Telegram", group = "launcher" }),

	-- Screenshot
	awful.key({ modKey, shiftKey }, "s", function()
		awful.spawn("maim -s | xclip -selection clipboard -t image/png")
	end, { description = "screenshot", group = "utils" }),

	-- Remmina
	awful.key({ modKey, shiftKey }, "r", function()
		awful.spawn("remmina")
	end, { description = "launch Remmina", group = "launcher" })

	)
return custom_keybinds
