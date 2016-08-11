
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Run in-game scripts. Requires LoadString to be enabled
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 3
command.Shorthand = "qs"
command.Params = {"..."}
command.Usage = "quickscript Source"
command.Description = [[Runs Source on the server.]] 

--// Now to the actual command
local rstore = game:GetService("ReplicatedStorage")
command.Init = function(main)
end

command.Run = function(main,user,...)
	local source = table.concat({...}," ")
	local func,err = CoreAPI.LuaVM(source)
	if (func) then
		local fenv = getfenv(func)
		fenv.script = nil
		setfenv(func,fenv)
		
		spawn(func)
		return true,"Ran your script!"
	else
		return false,"The script encountered an error: " .. tostring(err)
	end
end

return command
