local command = {}
command.PermissionLevel = 1
command.Shorthand = {"slock","sl"}
command.Params = {"Boolean","..."}
command.Usage = "serverlock true/false reason"
command.Description = [[Locks and unlocks the server.]] 

--// Now to the actual command
local locked = false
local reason = ""
command.Init = function(main)
	local players = game:GetService("Players")
	players.PlayerAdded:connect(function(p)
		wait(1)
		if (SyncAPI.GetPermissionLevel(p) <= 0 and locked) then
			if (reason == "") then
				p:Kick("The server is locked")
			else
				p:Kick("The server is locked for reason: " .. reason)
			end
		end
	end)
end

command.Run = function(main,user,lock,...)
	reason = table.concat({...}," ")
	locked = lock
	
	local players = game:getService("Players")
	for _,p in pairs(players:GetPlayers()) do
		local message = "The server has been " .. (lock and "locked" or "unlocked") .. (reason == "" and "" or " for reason: " .. reason)
		SyncAPI.DisplayNotification(p,message,"Check",10)
	end
	
	return true,(lock and "Locked" or "Unlocked") .. " the server"
end

return command