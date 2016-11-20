
--      @Description: Synchronized Admin Plugin
--      @Author: skeletonarcher12

local command = {}
command.PermissionLevel = 1 
command.Shorthand = nil
command.Params = {"PlayerList","String"} 
command.Usage = "resetstats player leaderstat"
command.Description = [[Resets the player's leaderstat. Only accepts IntValue and NumberValue]] 

command.Init = function(main)
end

command.Run = function(main,user,users,stat)
	local list = {}
	for _,player in pairs(users) do
		if player:FindFirstChild('leaderstats')~=nil then
			if player.leaderstats:FindFirstChild(stat)~=nil then
				local leadstat = player.leaderstats:FindFirstChild(stat)
				
				if leadstat:IsA("IntValue") then
					leadstat.Value = 0
				elseif leadstat:IsA("NumberValue") then
					leadstat.Value = 0
				elseif leadstat:IsA("StringValue") then
					leadstat.Value = ""
				elseif leadstat:IsA("BoolValue") then
					leadstat.Value = false
				else
					return false, "The type of leaderstat is invalid."
				end
			else
				return false,"No leaderstat value matching name"
			end
		end
		
		table.insert(list,player.Name)
	end
	
	return true,"Reset users " .. table.concat(list,", ") .. " stat " .. stat,
		list,user.Name .. " has reset your stat " .. stat
end

return command
