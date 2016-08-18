
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Messages all users in-game
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "m"
command.Params = {"..."}
command.Usage = "message Your text here"
command.Description = [[Displays the given message to all players.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,...)
	if (user == nil) then error("No user found") end
	local message = table.concat({...}," ")
	
	for _,pl in pairs(game:GetService("Players"):GetPlayers()) do
		SyncAPI.DisplayMessage(pl,user.Name,message)
	end
end

return command
