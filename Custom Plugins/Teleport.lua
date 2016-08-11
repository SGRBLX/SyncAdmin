
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Teleport selected users.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "tp"
command.Params = {"PlayerList","Player"}
command.Usage = "teleport Player1,Player2,Player3,... Target"
command.Description = [[Teleports all specified users to the target user.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,target)	
	if (target.Character and target.Character:findFirstChild("HumanoidRootPart") and target.Character.HumanoidRootPart:IsA("BasePart")) then
		local list = {}
		for _,player in pairs(users) do
			if (player.Character and player.Character:findFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart:IsA("BasePart")) then
				player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
			end
			table.insert(list,player.Name)
		end
		return true,"Teleported users " .. table.concat(list,", ") .. " to " .. target.Name,
				list,user.Name .. " has teleported you to " .. target.Name,
				{target.Name},user.Name .. " has teleported " .. #list .. (#list > 1 and " users " or " user ") .. "to you"
	elseif (target.Character == nil) then
		return false,"Cannot teleport to " .. target.Name .. " at this time. They do not have a character."
	elseif (target.Character:findFirstChild("HumanoidRootPart") == nil or not target.Character.HumanoidRootPart:IsA("BasePart")) then
		return false,"Cannot teleport to " .. target.Name .. " at this time. They do not have a HumanoidRootPart."
	end
end

return command
