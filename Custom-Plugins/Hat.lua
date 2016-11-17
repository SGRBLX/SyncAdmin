
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized
--      @Date of Creation: 30th, April, 2016

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList","Number"}
command.Usage = "hat Player ID"
command.Description = [[Give selected player a hat.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,id)
	if (user == nil) then error("No user found") end
	local hat = game:GetService("InsertService"):LoadAsset(id):GetChildren()
	if #hat < 1 then
		return false,"ID could not be loaded"
	end
	hat = hat[1]
	if not hat:IsA("Hat") and not hat:IsA("Accoutrement") then
		return false, "ID is not a hat"
	end
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		hat:Clone().Parent = player.Character
	end
	return true,"Given hat to " .. table.concat(list,", "),list,user.Name .. " has given you a hat."
end

return command
