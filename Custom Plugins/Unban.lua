
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Unbans a user from game.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Usage = "unban Username"
command.Description = [[Unbans the player with the given username. (full username)]] 

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

command.Run = function(main,user,users,reason)
	if (user == nil) then return false,"No user found" end
	
	if (users == nil) then
		return false,"No users specified"
	else
		local count = 0
		if (main:findFirstChild("Settings") == nil or main.Settings:findFirstChild("Banned") == nil) then return false,"Settings.Banned not found" end
		local playerssvc = main.Settings.Banned:children()
		for _,playername in pairs(strSplit(users:lower(),",")) do
			for _,player in pairs(playerssvc) do
				if (string.find(player.Name:lower(),playername) == 1) then
					player:Destroy()
					count = count + 1
				end
			end
		end
		if (count > 0) then
			return true,"Unbanned " .. count .. " users"
		else
			return false,"No ban entries found for those users"
		end
	end
end

return command
