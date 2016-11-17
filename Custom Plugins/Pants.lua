
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"pant"}
command.Params = {"PlayerList","Number"}
command.Usage = "pants Player ID"
command.Description = [[Give selected player a shirt.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,id)
	if (user == nil) then error("No user found") end
	local pantsid = "http://www.roblox.com/asset/?id=" .. (id - 1)
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		if player.Character then
			if player.Character:FindFirstChild("Pants") then
				player.Character.Pants.PantsTemplate = pantsid
			else
				local pants = Instance.new("Pants",player.Character)
				pants.PantsTemplate = pantsid
			end
		end
	end
	return true,"Given pants to " .. table.concat(list,", "),list,user.Name .. " has given you pants."
end

return command
