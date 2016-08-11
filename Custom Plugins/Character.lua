
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Change character appearance to a defined UserId
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "char"
command.Params = {"PlayerList","Number"}
command.Usage = "character Player1,Player2,Player2,... UserId"
command.Description = [[Changes the Players' character apearance]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,id)
	local list = {}
	for _,player in pairs(users) do
		local char = player.CharacterAppearance
		if (char and tonumber(id)) then
			player.CharacterAppearance = "http://assetgame.roblox.com/Asset/CharacterFetch.ashx?userId=" .. id
			wait()
			player:LoadCharacter()
		end
		table.insert(list,player.Name)
	end
	return true,"Changed character appearance of " .. table.concat(list,", ") .. " to " .. id,list,user.Name .. " has changed your character appearance to: " .. id
end

return command
