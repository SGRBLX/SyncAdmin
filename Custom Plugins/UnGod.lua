
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Removes god from the user
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "ungod"
command.Params = {"Optional:PlayerList"}
command.Usage = "ungod [Player1,Player2,Player3,...] [Duration]"
command.Description = [[Removes the specified players god mode. If no players
are specified, it will remove god mode from you. Will
accept multiple players separated by commas.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (users == nil) then users = {user} end
	local list = {}
	
	for _,player in pairs(users) do
		if player.Character then
			player.Character.Humanoid.MaxHealth = 100
			table.insert(list,player.Name)
		end
	end
	
	return true,"Removed god mode from: " .. table.concat(list,",") .. ".",list,user.Name .. " has removed your god mode."
end

return command
