local command = {}
command.PermissionLevel = 1
command.Shorthand = "grav"
command.Params = {"Number"}
command.Usage = "globalgravity Number"
command.Description = [[Changes the global game gravity]] 

--// Now to the actual command
command.Init = function()
end

command.Run = function(main,user,gravity)
	workspace.Gravity = gravity
	return true,"Set global game gravity to: " .. tostring(gravity) .. "."
end

return command
