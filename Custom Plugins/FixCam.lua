--[[
                                    un-Verified SyncAdmin Command
    ======================================================================================
    Authors                 Dark_Messiah
    Description             Resets the Player's CurrentCamera to default
    --------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "camfix"
command.Params = {}
command.Usage = "fixcam"
command.Description = [[Resets the Player's CurrentCamera to default]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user)
	local cameraResetLocalScript = script:FindFirstChild("LocalShortWolf") -- Find cameraResetLocalScript
	
	if cameraResetLocalScript ~= nil then
		cameraResetLocalScript = cameraResetLocalScript:Clone() -- Make a copy of cameraResetLocalScript
		cameraResetLocalScript.Parent = user.PlayerGui
		cameraResetLocalScript.Disabled = true
		cameraResetLocalScript.Disabnled = false
		return true,user.Name.."'s Camera has been reset"
	else
		return false,"FixCam's Dependency is missing"
	end
end

return command
