local command = {}
command.PermissionLevel = 1
command.Shorthand = {"banlist","banned","rekt"}
command.Params = {}
command.Usage = "bannedlist"
command.Description = [[Display the banned users list.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user)
	local message = "Banned Users List\n"
	for a,b in pairs(SyncAPI.GetBannedUsers()) do message = message .. a .. ": " .. b .. "\n" end
	local list = {}
	SyncAPI.DisplayScrollMessage(user,"BANNED LIST",message)
	return true,"Loaded the ban list."
end

return command
