
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Disable/Enable filtering on the users client.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 3
command.Shorthand = nil
command.Usage = "filteringtrustuser FullName true/false"
command.Description = [[Changes filtering and triggers a respawn on the given
player.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,name,filtering)
	CoreAPI.GoogleAnalytics.ReportEvent("PlaceId-" .. tostring(game.PlaceId), "[FilteringTrustUser Core Plugin Used]", "[Core Plugin Information]",1)
	local players = game:GetService("Players")
	local player = players:findFirstChild(name)
	
	if (player == nil) then error("Player not found") end
	
	local fe = (filtering == "false")
	if (filtering ~= "true" and filtering ~= "false") then error("Requires true/false for filtering") end
	
	local filteringOn = workspace.FilteringEnabled
	workspace.FilteringEnabled = fe
	
	local ts = game:GetService("TeleportService")
	ts:Teleport(game.PlaceId,player)
	
	local con
	con = players.PlayerAdded:connect(function(pl)
		if (pl.Name == name) then
			wait(1)
			workspace.FilteringEnabled = filteringOn
			con:Disconnect()
		end
	end)
end

return command
