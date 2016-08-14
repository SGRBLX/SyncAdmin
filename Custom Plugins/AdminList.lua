local command = {}
command.PermissionLevel = 1
command.Shorthand = "stafflist"
command.Params = {}
command.Usage = "adminlist"
command.Description = [[Display the admin list.]] 

--// Now to the actual command
local rstore = game:GetService("ReplicatedStorage")
command.Init = function(main)
end

command.Run = function(main,user)
	local message = "Staff List\n"
	for a,b in pairs(SyncAPI.GetModeratorList()) do message = message .. a .. ": " .. b .. "\n" end
	for a,b in pairs(SyncAPI.GetAdminList()) do message = message .. a .. ": " .. b .. "\n" end
	for a,b in pairs(SyncAPI.GetSuperAdminList()) do message = message .. a .. ": " .. b .. "\n" end
	local list = {}
	SyncAPI.DisplayScrollMessage(user,"ADMIN LIST",message)
	return true,"Loaded the admin list."
end

return command