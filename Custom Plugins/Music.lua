
--      @Description: Synchronized Admin Commands // Core Command Plugins
--      @Author: VolcanoINC, DataSynchronized
--      @Date of Creation: 26th, September, 2015
--		@Updated: 30th, September, 2015

local command = {}
command.PermissionLevel = 1 -- Allow only admin or higher to run (0: Everyone; 1: Admin; 2: Superadmin 3: Root)
command.Shorthand = {"play","audio","sound"} -- Rather than typing out the full command name, this can be a quick alternative
command.Params = {"Number","Optional:PlayerList"}
command.Usage = "music SoundID Player1,Player2,Player3,..."
command.Description = [[Plays the given SoundID for the given players.]] 

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

command.Run = function(main,user,id,users)
	if (user == nil) then error("No user found") end
	users = users or game:GetService("Players"):GetPlayers()
	
	local list1 = {}
	local list2 = {}
	for _,player in pairs(users) do
		spawn(function()
			if (player:findFirstChild("LockMusic") and player ~= user) then table.insert(list2,player.Name) return end
			table.insert(list1,player.Name)
			
			local snd = player:findFirstChild("music")
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
				snd.Parent = player
				wait(1)
				snd:play()
			end
		end)
	end
	wait(1)
	if (id == "stop") then
		return true,"Stopped music for players: " .. table.concat(list1,", ") .. "; The following have music locked: " .. table.concat(list2,", ")
	else
		return true,"Played music for players: " .. table.concat(list1,", ") .. "; The following have music locked: " .. table.concat(list2,", ")
	end
end

return command
