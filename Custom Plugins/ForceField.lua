
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Gives the user a forcefield.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "ff"
command.Params = {"Optional:PlayerList","Optional:Number"}
command.Usage = "forcefield [Player1,Player2,Player3,...] [Duration]"
command.Description = [[Gives the specified players forcefields. If no players
are specified, it will give a forcefield to you. Will
accept multiple players separated by commas.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,duration)
	if (users == nil) then users = {user} end
	local list = {}
	for _,player in pairs(users) do
		local ff = Instance.new("ForceField",player.Character)
		
		if (duration) then
			local d = game:GetService("Debris")
			d:AddItem(ff,duration)
		end
		
		table.insert(list,player.Name)
	end
	if (duration) then
		return true,"Given forcefields to: " .. table.concat(list,",") .. " for " .. duration .. " seconds.",list,user.Name .. " has given you a forcefield for " .. duration " seconds."
	else
		return true,"Given forcefields to: " .. table.concat(list,",") .. ".",list,user.Name .. " has given you a forcefield."
	end
end

return command
