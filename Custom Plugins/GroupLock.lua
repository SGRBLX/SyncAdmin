--[[
	@Description: Allows blockading only certain members of certain groups into your place(s).
	@Author: Dark_Messiah
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"glock","gl"}
command.Params = {"Boolean","..."}
command.Usage = "grouplock true/false reason"
command.Description = [[Locks and unlocks the server for groups.]] 

local locked = false
local reason = ""
local allowedGroups = {} -- Insert groupIds here.

function playerHasGroupAccess(player)
	for _,groupId in pairs(allowedGroups) do
		if player:IsInGroup(groupId) == true then
			return true
		end
	end
	
	return false
end

command.Init = function(main)
	local players = game:GetService("Players")
	players.PlayerAdded:connect(function(p)
		wait(1)
		if locked == true then
			if (SyncAPI.GetPermissionLevel(p) <= 0) or playerHasGroupAccess(p) == false then
				if (reason == "") then
					p:Kick("The server is locked")
				else
					p:Kick("The server is locked for reason: " .. reason)
				end
			end
		end
	end)
end

command.Run = function(main,user,lock,...)
	reason = table.concat({...}," ")
	locked = lock
	
	local players = game:getService("Players")
	for _,p in pairs(players:GetPlayers()) do
		local message = "The server has been " .. (lock and "group-locked" or "group-unlocked") .. (reason == "" and "" or " for reason: " .. reason)
		SyncAPI.DisplayNotification(p,message,"Check",10)
	end
	
	return true,(lock and "Group-Locked" or "Group-Unlocked") .. " the server"
end

return command
