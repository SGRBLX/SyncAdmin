
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Ban users from the game
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"SafePlayer","..."}
command.Usage = "ban Player Reason"
command.Description = [[Bans the player and displays the reason in the initial
kick message.]] 

--// Implement string split function
function strSplit(inputstr,sep)
	local t,i = {},1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

--// Now to the actual command
command.Init = function(main)
	if (main:findFirstChild("Settings") == nil or main.Settings:findFirstChild("Banned") == nil) then return end
	
	local banned = main.Settings.Banned
	local players = game:GetService("Players")
	players.PlayerAdded:connect(function(player)
		for _,ban in pairs(banned:children()) do
			if (ban.Name == player.Name or ban.Value == player.UserId) then
				player:Kick("You are banned from this server.") --// I've been here before.
				SyncAPI.DisplayNotification(player,"Player " .. player.Name .. " tried to join but is banned",5)
			end
		end
	end)
end

command.Run = function(main,user,player,...)
	if (user == nil) then error("No user found") end	
	local reason = table.concat({...}," ")
	local list = {}
	
	if (main:findFirstChild("Settings") == nil or main.Settings:findFirstChild("Banned") == nil) then return false,"Settings.Banned not found" end
	
	local v = Instance.new("IntValue")
	v.Name = player.Name
	v.Value = player.UserId
	v.Parent = main.Settings.Banned
	player:Kick(reason)
	
	return true,"Banned user " .. player.Name .. " for reason '" .. reason .. "'"
end

return command
