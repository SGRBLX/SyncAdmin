
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Anonymously message a user
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 2
command.Shorthand = "sm"
command.Params = {"PlayerList","..."}
command.Usage = "systemmmessage Player1,Player2,Player3,... Your text here"
command.Description = [[Displays the given message to the given players anonymously.]] 

--// Now to the actual command
local rstore = game:GetService("ReplicatedStorage")
command.Init = function(main)
end

command.Run = function(main,user,users,...)
	local message = table.concat({...}," ")
	local list = {}
	for _,player in pairs(users) do
		SyncAPI.DisplayMessage(player,"SYSTEM MESSAGE",message)
		table.insert(list,player.Name)
	end
	return true,"Shown system message to users: " .. table.concat(list,", ")
end

return command
