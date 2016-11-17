
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Makes the selected user fly.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"Player"}
command.Usage = "unmute Player"
command.Description = [[Enables that players' CoreGui chat]] 

command.Init = function(main)
end

command.Run = function(main,user,target)
	if (target and target:FindFirstChild("PlayerGui")) then
		local sscript = script.SA_MuteHandler:clone()
		sscript.Disabled = false
		sscript.Parent = target.PlayerGui
		return true,"Unmuted " .. target.Name
	end
	return false,"Cannot unmute " .. target.Name .. "; nowhere to run a LocalScript."
end

return command
