
--      @Description: Synchronized Admin Commands
--      @Author: VolcanoINC, DataSynchronized

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList","StringList","..."}
command.Usage = "ask player1,player2,player3,... opt1,opt2,opt3,... Message"
command.Description = [[Ask a player a question.]] 

--// Now to the actual command
command.Init = function(main)
	
end

command.Run = function(main,user,players,options,...)
	print(options)
	local title = user.Name .. " asks..."
	local msg = table.concat({...}," ")
	for _,player in pairs(players) do
		do
			local pl = player
			spawn(function()
				local resp,ok = SyncAPI.DisplayQuestionMessage(pl,title,msg,"Check",options)
				if (ok) then
					SyncAPI.DisplayNotification(user,pl.Name .. " responded with " .. resp,"Check",30)
				else
					SyncAPI.DisplayNotification(user,pl.Name .. " failed to respond","Cross",30)
				end
			end)
		end
	end
	return true,"Successfully dispatched your question"
end

return command
