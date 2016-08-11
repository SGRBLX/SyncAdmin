
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Shuts the game down.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 2
command.Shorthand = nil
command.Params = {"..."}
command.Usage = "shutdown Reason"
command.Description = [[Kicks all players and forces the game to shut down.]] 

--// Now to the actual command
local isClosed = false
local sdReason = ""
command.Init = function(main)
	local players = game:GetService("Players")
	players.PlayerAdded:connect(function(player)
		if (isClosed) then
			player:Kick("SERVER SHUTTING DOWN\n\n" .. sdReason)
		end
	end)
end

command.Run = function(main,user,...)
	if (user == nil) then error("No user found") end
	local reason = table.concat({...}," ")
	
	local players = game:GetService("Players")
	isClosed = true
	sdReason = reason
	for _,player in pairs(players:GetPlayers()) do
		player:Kick("SERVER SHUTTING DOWN\n\n" .. reason)
	end
end

return command
