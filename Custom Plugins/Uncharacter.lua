
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Author                 	Happyzachariah
	Description				Sets your character to your normal character appearance
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "unchar"
command.Params = {"PlayerList"}
command.Usage = "unchar Player1,Player2,..."
command.Description = [[Reset the selected players character appearance to their normal character.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users)
	local list = {}
	for _,player in pairs(users) do
		local char = player.CharacterAppearance
		if (char) then
			player.CharacterAppearance = "http://assetgame.roblox.com/Asset/CharacterFetch.ashx?userId="
			wait()
			player:LoadCharacter()
		end
		table.insert(list,player.Name)
	end
	return true,"Reset character appearance for: " .. table.concat(list,", "),list,user.Name .. " has reset your character appearance."
end

return command
