local command = {}
command.PermissionLevel = 2
command.Shorthand = nil
command.Params = {"PlayerList"}
command.Usage = "rocket"
command.Description = "[Donator] Give selected player a flying rocket."
command.AllowDonators = true

command.Init = function(main)
end

command.Run = function(main,user)
	if (user == nil) then error("No user found") end
	
	local list = {}
	if workspace.FilteringEnabled then
		SyncAPI.DisplayMessage(user,"Notice","This may not replicate to other users since FilteringEnabled is currently in use on this game.","Cross")
	end
	
    script.Rocket:Clone().Parent = user.Character
	user.Character.Rocket.Disabled = false
	return true,"Given you a rocket"
end

return command
