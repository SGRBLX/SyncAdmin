
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList","Number"}
command.Usage = "shirt Player ID"
command.Description = [[Give selected player a shirt.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,id)
	if (user == nil) then error("No user found") end
	local shirtid = "http://www.roblox.com/asset/?id=" .. (id - 1)
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		if player.Character then
			if player.Character:FindFirstChild("Shirt") then
				player.Character.Shirt.ShirtTemplate = shirtid
			else
				local shirt = Instance.new("Shirt",player.Character)
				shirt.ShirtTemplate = shirtid
			end
		end
	end
	return true,"Given shirt to " .. table.concat(list,", "),list,user.Name .. " has given you a shirt."
end

return command
