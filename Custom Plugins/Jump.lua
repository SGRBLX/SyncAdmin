
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Makes the defined user jump.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList"}
command.Usage = "jump Player"
command.Description = [[Jump a player.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,...)
	if (user == nil) then error("No user found") end
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		local char = player.Character
		player.Character.Humanoid.Jump = true
	end
	return true,"Jumped players: " .. table.concat(list),list,user.Name .. " has made your character jump."
end

return command
