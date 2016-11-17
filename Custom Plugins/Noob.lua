
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Makes you a noob
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "noob"
command.Params = {"PlayerList"}
command.Usage = "noob Player1,Player2,..."
command.Description = [[Makes the selected user a noob]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		local char = player.CharacterAppearance
		if (char) then
			player.CharacterAppearance = "http://assetgame.roblox.com/Asset/CharacterFetch.ashx?userId=0"
			wait()
			player:LoadCharacter()
		end
		table.insert(list,player.Name)
	end
	return true,"Made the following users a noob: " .. table.concat(list,", "),list,user.Name .. " has made you a noob"
end

return command
