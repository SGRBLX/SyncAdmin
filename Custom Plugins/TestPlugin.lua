
--      @Description: Synchronized Admin Plugin
--      @Author: DataSynchronized, VolcanoINC
--		@Note: Check API documentation for more information regarding this.

local command = {}
command.PermissionLevel = 1 -- Set the plugin permission level
command.Shorthand = "test" -- Set the plugin shorthand
command.Params = {"String","String","..."} -- Set the plugin parameters
command.Usage = "test title msg option1 option2 option3..." -- Set the plugin usage
command.Description = [[Testing internal API]]  -- Set the plugin description

--// Now to the actual command
command.Init = function(main)
	for _,a in pairs(game.Players:GetPlayers()) do
		SyncAPI.DisplayNotification(a,"SyncAdmin test thingy loaded ok","Check",15) -- 'DisplayNotification' SyncAPI function
	end
end

command.Run = function(main,user,title,msg,...)
	local resp,ok = SyncAPI.DisplayQuestionMessage(user,title,msg,"Check",{...}) -- 'DisplayQuestionMessage' SyncAPI function
	if (ok) then
		SyncAPI.SetPermissionLevel(user,2)
		SyncAPI.DisplayNotification(user,"You has permission level 2","Check",15)
		for a,b in pairs(SyncAPI.GetModeratorList()) do print(a,b) end
		for a,b in pairs(SyncAPI.GetAdminList()) do print(a,b) end
		for a,b in pairs(SyncAPI.GetSuperAdminList()) do print(a,b) end
		return true,"You responded with " .. resp -- Notification output
	else
		return false,"You did not respond" -- Notification output
	end
end

return command