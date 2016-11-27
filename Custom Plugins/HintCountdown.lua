--[[
	  ____                      _       _           _       
	 / ___| _   _ _ __   ___   / \   __| |_ __ ___ (_)_ __  
	 \___ \| | | | '_ \ / __| / _ \ / _` | '_ ` _ \| | '_ \ 
	  ___) | |_| | | | | (__ / ___ \ (_| | | | | | | | | | |
	 |____/ \__, |_| |_|\___/_/   \_\__,_|_| |_| |_|_|_| |_|
	        |___/                                                                                         
	               
	@Description: SyncAdmin example plugin command.
	@Author: skeletonarcher12
--]]

local command = {}
command.PermissionLevel = 1 -- Set the plugin permission level
command.Shorthand = {"hc","hcountdown"} -- Set the plugin shorthand
command.Params = {"Number","Optional:PlayerList"} -- Set the plugin parameters
command.Usage = "hintcountdown time Player1,Player2,Player3" -- Set the plugin usage
command.Description = [[Allows you to do a countdown from the hint bar]]  -- Set the plugin description

command.Init = function(main)
	
end

command.Run = function(main,user,number,targets)
	local i = number
	if (targets == nil or #targets == 0) then
		targets = game.Players:GetPlayers()
	end
	SyncAPI.DisplayNotification(user,"Started your countdown!","Check",15)
	while i >= 0 do 
		for _,p in pairs(targets) do 
			SyncAPI.DisplayHint(p,i,"Info",2)
		end
		i = i - 1
		wait(1.5)
	end
	for _,p in pairs(targets) do
		SyncAPI.DisplayMessage(p,"Go!","","Exclamation")
	end
	return true,"Countdown finished!"
end
return command
