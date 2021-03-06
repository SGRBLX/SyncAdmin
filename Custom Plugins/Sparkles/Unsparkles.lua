
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
command.Usage = "unsparkle Player1,Player2,..."
command.Description = [[Removes someone's sparkles]] 

command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		if (player.Character and player.Character:findFirstChild("HumanoidRootPart")) then
			for _,fire in pairs(player.Character.HumanoidRootPart:children()) do
				if (fire:IsA("Sparkles")) then fire:Destroy() end
			end
			table.insert(list,player.Name)
		end
	end
	return true,"Removed the following people's sparkles: " .. table.concat(list,", "),list,user.Name .. " removed your sparkles."
end

return command
