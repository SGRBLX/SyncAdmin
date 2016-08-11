
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Refresh selected users character.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "ref"
command.Params = {"PlayerList"}
command.Usage = "refresh Player"
command.Description = [[Refresh the selected users character.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,...)
	if (user == nil) then error("No user found") end
	local name = table.concat({...}," ")
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		
		if player.Character and player.Character:FindFirstChild("Torso") then
			local cf = player.Character.Torso.CFrame
			player:LoadCharacter()
			player.Character.Torso.CFrame = cf
		end		
		
	end
	return true,"Refreshed the following users: " .. table.concat(list,", "),list,user.Name .. " has refreshed you."
end

return command