
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Makes you a guest
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "guest"
command.Params = {"PlayerList"}
command.Usage = "guest Player1,Player2,..."
command.Description = [[Makes the selected user a guest]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		local char = player.CharacterAppearance
		if (char) then
			player.CharacterAppearance = "http://assetgame.roblox.com/Asset/CharacterFetch.ashx?userId=1"
			wait()
			player:LoadCharacter()
		end
		table.insert(list,player.Name)
	end
	return true,"Made the following users a guest: " .. table.concat(list,", "),list,user.Name .. " has made you a guest"
end

return command
