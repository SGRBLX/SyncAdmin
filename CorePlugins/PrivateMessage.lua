
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Private message users in-game
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "pm"
command.Params = {"PlayerList","..."}
command.Usage = "privatemessage Player1,Player2,Player3,... Your text here"
command.Description = [[Displays the given message to the given players for 5 
seconds.]] 

--// Now to the actual command
local rstore = game:GetService("ReplicatedStorage")
command.Init = function(main)
end

command.Run = function(main,user,users,...)
	if (user == nil) then error("No user found") end
	local message = table.concat({...}," ")
	local list = {}
	for _,player in pairs(users) do
		SyncAPI.DisplayMessage(player,user.Name,message)
		table.insert(list,player.Name)
	end
	return true,"Shown message to users: " .. table.concat(list,", ")
end

return command
