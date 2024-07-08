-- In rc.lua
-- Ensure you have the necessary requires
local awful = require("awful")
local gears = require("gears")

-- Define your modKey (usually Mod4, the Super or Windows key)
local modKey = "Mod4"
local altKey = "Mod1"

default_keybinds = require("default_keybinds")
-- Key bindings
globalkeys = gears.table.join(
	default_keybinds,
	-- Existing keybindings here...

	-- Add new keybindings based on your Hyprland config
	-- Close active window
	awful.key({ modKey }, "c", function()
		awful.spawn("xdotool getactivewindow windowclose")
	end, { description = "close active window", group = "client" }),

	-- Launch file manager (pcmanfm)
	awful.key({ modKey }, "e", function()
		awful.spawn("pcmanfm")
	end, { description = "launch pcmanfm", group = "launcher" }),

	-- IntelliJ IDEA
	-- if hostname == "arch-vtp" then launch IntelliJ IDEA Ultimate Edition
	-- else launch IntelliJ Gateway
	awful.key({ modKey }, "i", function()
		awful.spawn("sh arch/utils/launch-idea.sh")
	end, { description = "launch IntelliJ IDEA", group = "launcher" }),

	-- Launch application launcher (rofi)
	awful.key({ modKey }, "r", function()
		awful.spawn("rofi -show drun -show-icons -width 30 -lines 10")
	end, { description = "run prompt", group = "launcher" }),

	-- Launch nwg-bar
	awful.key({ modKey }, "x", function()
		awful.spawn("nwg-bar")
	end, { description = "launch nwg-bar", group = "launcher" }),

	-- Toggle night mode
	awful.key({ modKey, "Shift" }, "s", function()
		awful.spawn("sh arch/utils/night-mode.sh")
	end, { description = "toggle night mode", group = "custom" }),

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

	-- Volume controls
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn("pamixer -i 10 --allow-boost --set-limit 150")
	end, { description = "raise volume", group = "media" }),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn("pamixer -d 10 --allow-boost")
	end, { description = "lower volume", group = "media" }),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn("pamixer -t")
	end, { description = "mute volume", group = "media" }),
	awful.key({}, "XF86AudioMicMute", function()
		awful.spawn("pamixer --default-source -t")
	end, { description = "mute microphone", group = "media" }),

	awful.key({ modKey}, "]", function()
		awful.spawn("pamixer -i 5 --allow-boost --set-limit 150")
	end, { description = "raise volume", group = "media" }),
	awful.key({ modKey}, "[", function()
		awful.spawn("pamixer -d 5 --allow-boost")
	end, { description = "lower volume", group = "media" }),
	awful.key({ modKey, altKey }, "m", function()
		awful.spawn("pamixer -t")
	end, { description = "mute volume", group = "media" }),

	-- Brightness controls
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn("brightnessctl set 10%+")
	end, { description = "increase brightness", group = "screen" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn("brightnessctl set 10%-")
	end, { description = "decrease brightness", group = "screen" }),

	-- Screenshot
	awful.key({}, "Print", function()
		awful.spawn("maim | xclip -selection clipboard -t image/png")
	end, { description = "take screenshot", group = "screen" }),
	awful.key({ modKey, "Shift" }, "s", function()
		awful.spawn("maim -s | xclip -selection clipboard -t image/png")
	end, { description = "take screenshot of selection", group = "screen" }),
	awful.key({ modKey, altKey }, "Print", function()
		awful.spawn("maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png")
	end, { description = "take screenshot of active window", group = "screen" })
)

return globalkeys
