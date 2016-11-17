
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized
--      @Date of Creation: 30th, April, 2016

local command = {}
command.PermissionLevel = 2
command.Shorthand = nil
command.Params = {"PlayerList","Number"}
command.Usage = "gear Player ID"
command.Description = [[Give selected player a gear item.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,id)
	if (user == nil) then error("No user found") end
	local gear = game:GetService("InsertService"):LoadAsset(id):GetChildren()
	if #gear < 1 then
		return false,"ID could not be loaded"
	end
	gear = gear[1]
	if not gear:IsA("Tool") then
		return false, "ID is not a gear"
	end
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		gear:Clone().Parent = player.Backpack
	end
	return true,"Given gear item to " .. table.concat(list,", "),list,user.Name .. " given you a gear item."
end

return command
