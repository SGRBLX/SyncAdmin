
--      @Description: Synchronized Admin Plugin
--      @Author: skeletonarcher12
--		@Note: Check API documentation for more information regarding this.

local command = {}
command.PermissionLevel = 1 -- Set the plugin permission level
command.Shorthand = nil -- Set the plugin shorthand
command.Params = {"SafePlayer","String","String"} -- Set the plugin parameters
command.Usage = "change player leaderstat value" -- Set the plugin usage
command.Description = [[Changes the player's leaderstat. Only accepts IntValue, StringValue, NumberValue and BoolValue]]  -- Set the plugin description

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,target,stat,...)
	local newvalue = ...
	local leaderstats = target:FindFirstChild("leaderstats")
	if not leaderstats then
		return false, "No leaderstats found for player"
	end
	local leadstat = leaderstats:FindFirstChild(stat)
	if not leadstat then
		return false,"No leaderstat value matching name"
	end
	if leadstat:IsA("IntValue") then
		if tonumber(newvalue) then
			local old = leadstat.Value
			leadstat.Value = math.floor(tonumber(newvalue))
			return true, "Changed " .. target.Name .. "'s " .. stat .. " value from: " .. old .. ", to: " .. newvalue
		else 
			return false, "The value you entered is not compatible with the type of leaderstat you tried to change."
		end
	elseif leadstat:IsA("StringValue") then
		local old = leadstat.Value
		leadstat.Value = newvalue
		return true, "Changed " .. target.Name .. "'s " .. stat .. " value from: " .. old .. ", to: " .. newvalue
	elseif leadstat:IsA("NumberValue") then
		if tonumber(newvalue) then
			local old = leadstat.Value
			leadstat.Value = tonumber(newvalue)
			return true, "Changed " .. target.Name .. "'s " .. stat .. " value from: " .. old .. ", to: " .. newvalue
		else 
			return false, "The value you entered is not compatible with the type of leaderstat you tried to change."
		end
	elseif leadstat:IsA("BoolValue") then
		if string.lower(newvalue) == "false" then
			local old = leadstat.Value 
			leadstat.Value = false
			return true, "Changed " .. target.Name .. "'s " .. stat .. " value from: " .. tostring(old) .. ", to: " .. newvalue
		elseif string.lower(newvalue) == "true" then
			local old = leadstat.Value 
			leadstat.Value = true
			return true, "Changed " .. target.Name .. "'s " .. stat .. " value from: " .. tosring(old) .. ", to: " .. newvalue
		else 
			return false, "The value you entered is not compatible with the type of leaderstat you tried to change."
		end
	else
		return false, "The type of leaderstat is invalid."
	end
end

return command
