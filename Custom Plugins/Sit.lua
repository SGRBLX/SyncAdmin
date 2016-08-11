
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil 
command.Params = {"PlayerList"}
command.Usage = "sit Player"
command.Description = [[Make the selected user sit.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (user == nil) then error("No user found") end
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		local char = player.Character
        
        if char ~= nil then
            player.Character.Humanoid.Sit = true
        end
	end
	return true,"Made the following users sit: " .. table.concat(list,", "),list,user.Name .. " has made you sit."
end

return command
