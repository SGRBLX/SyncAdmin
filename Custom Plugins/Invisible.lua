
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = "invis"
command.Params = {"PlayerList"}
command.Usage = "invisible Player"
command.Description = [[Makes the selected users invisible.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (user == nil) then error("No user found") end
	local name = table.concat({}," ")
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		function hi (x)
		    for _,i in pairs (x:children()) do
		        hi (i)
		        if i:IsA("BasePart") or i:IsA("Decal") then
		            i.Transparency = 1
		        end
			end
		end
		hi (player.Character)
	end
	return true,"Made the following users invisible: " .. table.concat(list,", "),list,user.Name .. " has made you invisible."
end

return command
