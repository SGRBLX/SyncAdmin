--[[
                                    Verified SyncAdmin Command
    ======================================================================================
    Authors                 Dark_Messiah
    Description             Resets the Player's CurrentCamera to default
	
	Note:					Please test things before you submit things. This is not
							a contest on who can send the best drunk text message. Thanks!
    --------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = "camfix"
command.Params = {}
command.Usage = "fixcam"
command.Description = [[Resets the Player's CurrentCamera to default]] 

command.Init = function(main)
end

command.Run = function(main,user)
	if user == nil then
		return false,"No user was found"
	end
	
	local cameraResetLocalScript = script:FindFirstChild("FixCam") -- Find cameraResetLocalScript
	
	if cameraResetLocalScript ~= nil then
		cameraResetLocalScript = cameraResetLocalScript:Clone() -- Make a copy of cameraResetLocalScript
		cameraResetLocalScript.Parent = user.PlayerGui
		cameraResetLocalScript.Disabled = false
		
		return true,user.Name.."'s Camera has been reset"
	else
		return false,"FixCam Dependency is missing"
	end
end

return command