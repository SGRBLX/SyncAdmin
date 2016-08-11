
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Changes the selected users humanoid walkspeed.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"ws","speed"}
command.Params = {"PlayerList","Number"}
command.Usage = "walkspeed Player1,Player2,Player2,... Speed"
command.Description = [[Changes the Players' walkspeed]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,speed)
	local list = {}
	for _,player in pairs(users) do
		local char = player.Character
		if (char and char:findFirstChild("Humanoid") and tonumber(speed)) then
			char.Humanoid.WalkSpeed = speed
		end
		table.insert(list,player.Name)
	end
	return true,"Set walkspeed of " .. table.concat(list,", ") .. " to " .. speed,list,user.Name .. " has set your walkspeed to " .. speed
end

return command
