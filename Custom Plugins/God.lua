
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Gives the user god mode.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "god"
command.Params = {"Optional:PlayerList"}
command.Usage = "god [Player1,Player2,Player3,...] [Duration]"
command.Description = [[Gives the specified players god mode. If no players
are specified, it will give a god mode to you. Will
accept multiple players separated by commas.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (users == nil) then users = {user} end
	local list = {}
	
	for _,player in pairs(users) do
		if player.Character then
			player.Character.Humanoid.MaxHealth = math.huge
			table.insert(list,player.Name)
		end
	end
	
	return true,"Given god mode to: " .. table.concat(list,",") .. ".",list,user.Name .. " has given you god mode."
end

return command
