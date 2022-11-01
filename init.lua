local wibox = require("wibox")
local gears = require("gears")

volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

local function update_volume(widget)
   local fd = io.popen("amixer -D pulse get Master")
   if fd == nil then
	   return
	end
   local status = fd:read("*all")
   fd:close()

   local volNum = tonumber(string.match(status, "(%d?%d?%d)%%"))
   local volume = string.format("% 3d", volNum)

   status = string.match(status, "%[(o[^%]]*)%]")
   if status ~= "on" then
	   widget:set_markup("M")
   else
	widget:set_markup(volume .. "%")
	end
end

update_volume(volume_widget)


gears.timer{
	timeout = 1,
	call_now = true,
	autostart = true,
	callback = function()
		update_volume(volume_widget)
	end
}

