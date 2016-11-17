
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Makes the selected user fly.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "fly"
command.Params = {"PlayerList"}
command.Usage = "fly Player1,Player2,..."
command.Description = [[Allows the selected players to fly. Use X to toggle fly mode after using this command.]] 

command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		local flyScript = script.SA_FlyScript:clone()
		flyScript.Disabled = false
		flyScript.Parent = player.Character
		table.insert(list,player.Name)
	end
	return true,"Made the following users fly: " .. table.concat(list,", "),list,user.Name .. " has made you fly, press X to toggle."
end

return command
