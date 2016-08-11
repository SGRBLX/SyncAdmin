
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized
--      @Date of Creation: 30th, April, 2016

local command = {}
command.PermissionLevel = 0
command.Shorthand = nil 
command.Params = {}
command.Usage = "ping"
command.Description = [[Returns your ping to the server.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user)
	if (user == nil) then error("No user found") end
	local pingtime = 1e9
	local ok,err = pcall(function()
		local func = game:GetService("ReplicatedStorage").SyncAdminNetworking.Ping
		local rnd = math.random(0,1e9)
		local t = tick()
		local result = func:InvokeClient(user,rnd)
		if result == rnd then
			pingtime = tick() - t
		end
	end)
	if ok then
		return true,"Your ping is: " .. math.floor(pingtime * 1000) .. "ms"
	else
		return false,"An error occured with your request"
	end
end

return command
