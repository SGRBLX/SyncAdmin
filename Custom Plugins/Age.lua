
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				View the account age of a player.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"plrage","playerage"}
command.Params = {"Player"}
command.Usage = "age Player"
command.Description = [[Views the account age of a player.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,player)
	if (player) then
		return true,"The age of " .. player.Name .. "'s account is " .. player.AccountAge .. " days old."
	else
		return false,"The player could not be found."
	end
end

return command
