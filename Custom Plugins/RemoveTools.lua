
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Removes tools from the selected player.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"deltools","cleartools"}
command.Params = {"PlayerList",}
command.Usage = "removetools Player"
command.Description = [[Removes tools from the selelcted players]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	if (users == nil) then users = {user} end
	local list = {}
	for _,player in pairs(users) do
		player.Backpack:ClearAllChildren()
		table.insert(list,player.Name)
	end
	return true,"Removed tools from: " .. table.concat(list,",") .. ".",list,user.Name .. " has removed your tools."
end

return command
