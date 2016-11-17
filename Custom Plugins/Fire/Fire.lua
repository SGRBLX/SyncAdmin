
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
command.Usage = "fire Player1,Player2,..."
command.Description = [[Sets the players' torso on fire!!]] 

command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		if (player.Character) then
			Instance.new("Fire",player.Character:findFirstChild("HumanoidRootPart"))
			table.insert(list,player.Name)
		end
	end
	return true,"Set the following people ablaze: " .. table.concat(list,", "),list,user.Name .. " set your torso on fire."
end

return command
