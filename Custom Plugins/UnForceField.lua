
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Removes forcefield from users
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "unff"
command.Params = {"Optional:PlayerList"}
command.Usage = "unforcefield [Player1,Player2,Player3,...]"
command.Description = [[Removes any forcefields from the specified players. If no
players are specified, it will remove yours. Will
accept multiple players separated by commas.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (users == nil) then users = {user} end
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		
		if (player.Character) then
			for _,a in pairs(player.Character:children()) do
				if (a:IsA("ForceField")) then a:Destroy() end
			end
		end
	end
	return true,"Taken forcefields from: " .. table.concat(list),list,user.Name .. " has removed your forcefield."
end

return command
