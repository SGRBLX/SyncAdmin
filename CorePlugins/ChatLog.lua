
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				View in-game chat logs
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"chatlogs","chatl","clog"}
command.Params = {"Optional:String","..."}
command.Usage = "chatlog [Option] [Parameters]"
command.Description = [[Displays a chatlog, newest message first. Currently
the only available option is "search".]] 

--// Do all the rest
local rstore = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local ssvc = game:GetService("ServerScriptService")

command.Init = function(main)
end

--//Remove and redo
command.Run = function(main,user,option,...)
	local chatlog = SyncAPI.GetChatLog()
	local nChatlog = chatlog
	if (option == "search") then
		nChatlog = {}
		local search = table.concat({...}," ")
		for _,ln in pairs(chatlog) do
			if (string.find(ln:lower(),search:lower())) then table.insert(nChatlog,ln) end
		end
	end
	
	chatlog = nChatlog
	nChatlog = {}
	for _,ln in pairs(chatlog) do
		for a = 1,#ln,60 do
			table.insert(nChatlog,string.sub(ln,a,a+59))
		end
	end
	SyncAPI.DisplayScrollMessage(user,"Chatlog [Newest first]",table.concat(nChatlog,"\n"))
end

return command
