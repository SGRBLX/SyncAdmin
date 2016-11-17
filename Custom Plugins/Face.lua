
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList","Number"}
command.Usage = "face Player Id"
command.Description = [[Changes the players' face]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,id)
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		if (player.Character and player.Character:findFirstChild("Head")) then
			for _,i in pairs(player.Character.Head:children()) do
				if (i:IsA("Decal") and i.Face == Enum.NormalId.Front) then
					i.Texture = "rbxassetid://" .. id
				end
			end
		end
	end
	return true,"Change face of users: " .. table.concat(list,", "),list,user.Name .. " has changed your face."
end

return command
