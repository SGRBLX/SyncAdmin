
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC], Spearritt(Hierarchy update)
	Description				Ban users from the game
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 2
command.Shorthand = nil
command.Params = {"SafePlayer","..."}
command.Usage = "ban Player Reason"
command.Description = [[Bans the player and displays the reason in the initial kick message.]] 

--// Now to the actual command
command.Init = function(main)	
	local players = game:GetService("Players")
	players.PlayerAdded:connect(function(player)
		for _,ban in pairs(SyncSettings.Banned) do
			if (ban.Username == player.Name or ban.UserId == player.UserId) then
				player:Kick("You are banned from this server.") --// I've been here before.
				SyncAPI.DisplayNotification(player,"Player " .. player.Name .. " tried to join but is banned",5)
			end
		end
	end)
end

command.Run = function(main,user,player,...)
	if (SyncAPI.GetPermissionLevel(user) > SyncAPI.GetPermissionLevel(player)) then
		if (user == nil) then error("No user found") end	
		local reason = table.concat({...}," ")
		
		table.insert(SyncSettings.Banned,{ Username = player.Name; UserId = player.UserId; })
		player:Kick(reason)
		return true,"Banned user " .. player.Name .. " for reason '" .. reason .. "'"
	else
		return false,"You cannot run this command on someone with a higher permission level than you."
	end
	
end

return command
