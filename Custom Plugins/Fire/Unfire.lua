
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList"}
command.Usage = "unfire Player1,Player2,..."
command.Description = [[Extinguishes the fire from someone's torso]] 

command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		if (player.Character and player.Character:findFirstChild("HumanoidRootPart")) then
			for _,fire in pairs(player.Character.HumanoidRootPart:children()) do
				if (fire:IsA("Fire")) then fire:Destroy() end
			end
			table.insert(list,player.Name)
		end
	end
	return true,"Extinguished the following users: " .. table.concat(list,", "),list,user.Name .. " has removed your fire."
end

return command
