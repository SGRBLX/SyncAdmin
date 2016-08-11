
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Developer commands to view in-game explorer.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 3
command.Shorthand = nil
command.Params = {"PlayerList"}
command.Usage = "explorer Player"
command.Description = [[In-game explorer (Developer Tool).]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,...)
	if (user == nil) then error("No user found") end
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		local char = player.Character
		script.Explorer:clone().Parent = player.PlayerGui
		CoreAPI.GoogleAnalytics.ReportEvent("PlaceId-" .. tostring(game.PlaceId), "[Explorer Core Plugin Used]", "[Core Plugin Information]",1)
		if workspace.FilteringEnabled then
			SyncAPI.DisplayMessage(player,"Notice","Changes on the explorer will not replicate to the server since filtering is currently enabled on this server.")
		end
	end
	return true,"Given in-game explorer to: " .. table.concat(list),list,user.Name .. " has given you an in-game explorer."
end

return command
