
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil 
command.Params = {"PlayerList"}
command.Usage = "freeze Player"
command.Description = [[Freeze a selected player.]] 

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
			function freeze (x)
			    for _,i in pairs (x:children()) do
			        freeze (i)
			        if i:IsA("BasePart") then
			            i.Anchored = true
						char.Humanoid.WalkSpeed = "0"
			        end
				end
			end
			
			freeze (char)
        end
	end
	return true,"Frozen players: " .. table.concat(list,", "),list,user.Name .. " has frozen you."
end

return command
