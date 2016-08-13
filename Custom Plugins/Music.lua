
--      @Description: Synchronized Admin Commands // Core Command Plugins
--      @Author: VolcanoINC, DataSynchronized
--      @Date of Creation: 26th, September, 2015

local command = {}
command.PermissionLevel = 1 -- Allow only admin or higher to run (0: Everyone; 1: Admin; 2: Superadmin 3: Root)
command.Shorthand = {"play","audio","sound"} -- Rather than typing out the full command name, this can be a quick alternative
command.Params = {"Number"}
command.Usage = "music SoundID"
command.Description = [[Plays the given SoundID.]] 

--// Implement string split function
function strSplit(inputstr,sep)
	local t,i = {},1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,id)
	if (user == nil) then error("No user found") end
	
	local list1 = {}
	local list2 = {}
	spawn(function()
		local snd = workspace:findFirstChild("music")
		if (snd) then
			if (id == "stop") then
				snd:stop()
				wait(1)
				snd:Destroy()
			else
				snd:stop()
				wait(1)
				snd.SoundId = "rbxassetid://" .. id
				wait(1)
				snd:play()
			end
		elseif (id ~= "stop") then
			local snd = Instance.new("Sound")
			snd.Name = "music"
			snd.SoundId = "rbxassetid://" .. id
			snd.Looped = true
			snd.Parent = workspace
			wait(1)
			snd:play()
		end
	end)
	wait(1)
	if (id == "stop") then
		return true,"Stopped music"
	else
		return true,"Played music"
	end
end

return command