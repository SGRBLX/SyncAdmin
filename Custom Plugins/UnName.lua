
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Removes the selected users name
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList"}
command.Usage = "unname Player"
command.Description = [[Changes the Players' character name back to what it 
originally was.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (user == nil) then error("No user found") end
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		local char = player.Character
		if (char) then
			if (char:findFirstChild("NameModel") and char.NameModel.Value) then
				char.NameModel.Value:Destroy()
				char.NameModel:Destroy()
			end
			if (char:findFirstChild("Head")) then
				char.Head.Transparency = 0
			end
		end
	end
	return true,"Unnamed players " .. table.concat(list,", "),list,user.Name .. " has removed your name."
end

return command
