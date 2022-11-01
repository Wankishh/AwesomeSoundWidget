## Sound Widget ##

Feel free to fork if you want


1. Checkout in ~/.config/awesome
2. Require it in rc.lua
3. go to your right layout widgets and just add volume_widget (its exported )


Based on http://web.archive.org/web/20130928001745/http://awesome.naquadah.org/wiki/Volume_control_and_display
Adjusted it for my needs and etc


Also you can add media controls by

awful.key({}, "XF86AudioRaiseVolume", function ()
		awful.util.spawn("amixer -D pulse sset Master 5%+", false)
		end),
	awful.key({}, "XF86AudioLowerVolume", function ()
			awful.util.spawn("amixer -D pulse sset Master 5%-", false)
			end),
	awful.key({}, "XF86AudioMute", function ()
			awful.util.spawn("amixer -D pulse sset Master toggle", false)
			end)
