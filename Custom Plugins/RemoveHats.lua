
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"nohats"}
command.Params = {"PlayerList"}
command.Usage = "removehats"
command.Description = [[Removes the players' hats]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		if (player.Character) then
			for _,i in pairs(player.Character:children()) do
				if (i:IsA("Accoutrement")) then
					i:Destroy()
				end
			end
		end
	end
	return true,"Removed hats from " .. table.concat(list,", "),list,user.Name .. " has removed your hats."
end

return command
