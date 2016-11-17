
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Teleport selected users to you.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "tome"
command.Params = {"PlayerList","Optional:Player"}
command.Usage = "teleport Player1,Player2,Player3,... user"
command.Description = [[Teleports all specified users to the user.]] 

command.Init = function(main)
end

command.Run = function(main,user,users)
	if (user.Character and user.Character:findFirstChild("HumanoidRootPart") and user.Character.HumanoidRootPart:IsA("BasePart")) then
		local list = {}
		for _,player in pairs(users) do
			if (player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart:IsA("BasePart")) then
				player.Character.HumanoidRootPart.Velocity = Vector3.new()
				player.Character.HumanoidRootPart.CFrame = user.Character.HumanoidRootPart.CFrame
			end
			table.insert(list,player.Name)
		end
		return true,"Brought users " .. table.concat(list,", ") .. " to you",
				list,user.Name .. " has brought you"
	elseif (user.Character == nil) then
		return false,"Cannot bring users at this time. You do not have a character."
	elseif (user.Character:FindFirstChild("HumanoidRootPart") == nil or not user.Character.HumanoidRootPart:IsA("BasePart")) then
		return false,"Cannot bring users at this time. You do not have a HumanoidRootPart."
	end
end

return command
