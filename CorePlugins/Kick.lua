
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Kicks the user from game.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList","..."}
command.Usage = "kick Player Reason"
command.Description = [[Kicks the player and displays the reason in the kick 
message.]]

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,players,...)
	if (user == nil) then error("No user found") end
	local reason = table.concat({...}," ")
	
	local list = {}
	for _,player in pairs(players) do
		table.insert(list,player.Name)
		player:Kick(reason)
	end
	
	return true,"Kicked users: " .. table.concat(list) .. " for reason '" .. reason .. "'" 
end

return command
