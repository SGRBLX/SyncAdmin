
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = "vis" 
command.Params = {"PlayerList"}
command.Usage = "visible Player"
command.Description = [[Makes the selected users visible.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (user == nil) then error("No user found") end
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		
		function hi (x)
		    for _,i in pairs (x:children()) do
		        hi (i)
		        if i:IsA("BasePart") or i:IsA("Decal") then
		            i.Transparency = 0
		        end
			end
		end
		hi (player.Character)
		player.Character.HumanoidRootPart.Transparency = 1 -- Fix a bug regarding torso being blue
	end
	return true,"Made the following users visible " .. table.concat(list,", "),list,user.Name .. " has made you visible."
end

return command
