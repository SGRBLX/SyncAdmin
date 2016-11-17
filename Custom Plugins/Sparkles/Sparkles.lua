
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
command.Usage = "sparkle Player1,Player2,..."
command.Description = [[Gives a player sparkles]] 

command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		if (player.Character) then
			Instance.new("Sparkles",player.Character:findFirstChild("HumanoidRootPart"))
			table.insert(list,player.Name)
		end
	end
	return true,"Gave the following people sparkles: " .. table.concat(list,", "),list,user.Name .. " gave you sparkles"
end

return command
