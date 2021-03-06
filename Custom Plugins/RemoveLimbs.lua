
--[[
								Verified SyncAdmin Plugin
	======================================================================================
	Authors 				HighSpearritt
	Description				Removes the selected users limbs.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"rlimbs","removelimbs"}
command.Params = {"PlayerList"}
command.Usage = "rlimbs Player1,Player2,Player3"
command.Description = [[Removes the selected players limbs.]] 

command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		local c = player.Character
		if c then
			 for _,i in pairs(c:GetChildren()) do
				if i:IsA("BasePart") then
					if i.Name ~= "Torso" and i.Name ~= "Head" and i.Name ~= "LowerTorso" and i.Name ~= "UpperTorso" and i.Name ~= "HumanoidRootPart" then
						i:Destroy()
					end
				end
			end
		end
		table.insert(list,player.Name)
	end
	return true,"Removed the limbs of " .. table.concat(list,", "),user.Name .. " has removed your limbs. "
end

return command
