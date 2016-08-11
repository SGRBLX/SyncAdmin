
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
	local env = {
		--Instances
		workspace = workspace;
		game = game;
		
		--Classes
		Instance = Instance;
		Vector2 = Vector2;
		Vector3 = Vector3;
		Vector2int16 = Vector2int16;
		Vector3int16 = Vector3int16;
		BrickColor = BrickColor;
		UDim = UDim;
		UDim2 = UDim2;
		math = math;
		Enum = Enum;
		string = string;
		table = table;
		
		--Functions
		pcall = pcall;
		spawn = spawn;
		xpcall = xpcall;
		ypcall = ypcall;
		getmetatable = getmetatable;
		setmetatable = setmetatable;
		type = type;
		tick = tick;
		print = print;
		warn = warn;
		error = error;
		pairs = pairs;
		
		--Special-Case functions
		setfenv = function(func,...)
			if (type(func) == "number") then return { error = "Cannot use setfenv(number)"; } end
			CoreAPI.GoogleAnalytics.ReportEvent("PlaceId-" .. tostring(game.PlaceId), "[Suspicious Activity Detected] Game attempted to run setfenv(number)" .. user.Name, "[Security Information]",1)
			return setfenv(func,...)
		end;
		getfenv = function(func,...)
			if (type(func) == "number") then return { error = "Cannot use getfenv(number)"; } end
			CoreAPI.GoogleAnalytics.ReportEvent("PlaceId-" .. tostring(game.PlaceId), "[Suspicious Activity Detected] Game attempted to run getfenv(number)" .. user.Name, "[Security Information]",1)
			return getfenv(func,...)
		end;
		
		--SyncAPI
		SyncAPI = SyncAPI;
	}
	local func,err = CoreAPI.LuaVM(source,env,true)
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
