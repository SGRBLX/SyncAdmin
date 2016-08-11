
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				View command log done by admin users
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"Optional:String","..."}
command.Usage = "adminlog"
command.Description = [[Displays a log of all commands that were run. Currently
the only available option is "search".]] 

--// Do all the rest
local rstore = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local ssvc = game:GetService("ServerScriptService")

command.Init = function(main)
end

--//Remove and redo
command.Run = function(main,user,option,...)
	local adminlog = SyncAPI.GetAdminLog()
	local nChatlog = adminlog
	if (option == "search") then
		nChatlog = {}
		local search = table.concat({...}," ")
		for _,ln in pairs(adminlog) do
			if (string.find(ln:lower(),search:lower())) then table.insert(nChatlog,ln) end
		end
	end
	SyncAPI.DisplayScrollMessage(user,"Admin Log [Newest first]",table.concat(nChatlog,"\n"))
end

return command
