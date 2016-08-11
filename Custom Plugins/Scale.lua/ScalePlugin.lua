local command = {}
command.PermissionLevel = 2 
command.Shorthand = nil
command.Params = {"PlayerList","Number"}
command.Usage = "scale Player Number"
command.Description = [[ Scales the player with the specified scale value ]] 

--// Now to the actual command
command.Init = function(main)
end

local scaleDB = {}
function cleanupDB()
	for i,v in pairs(scaleDB) do
		if v and v.Parent == nil then
			scaleDB[i] = nil
		end
	end
end

command.Run = function(main,user,users,scale)
	if (user == nil) then error("No user found") end
	
	local _maxlimit = 10
	local _minlimit = 0.3
	
	if scale > _maxlimit then
		return false,"Cannot scale player higher than " ..  _maxlimit .. "."
	elseif scale < _minlimit then
		return false,"Cannot scale player less than " ..  _minlimit .. "."
	end
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		if player.Character then
			local Character = player.Character
			
			local cscale = scaleDB[Character]
			if not cscale then cscale = 1 end
			scaleDB[Character] = scale
			
			local factor = scale/cscale
			
			local Humanoid = Character:FindFirstChild("Humanoid")
			local Debris = game:GetService("Debris")
			
			local ResizeModule = require(script.Scale)
			
			function DestroyScript()
				Debris:AddItem(script, 1)
			end
			
			if not Humanoid then
				DestroyScript()
				return
			end
			
			local ResizeData = ResizeModule.ScaleCharacter(Character, factor, {ScaleTools = true, ScaleHats = true,})
			ResizeData.StateChanged.Changed:connect(function(State)
				if State then
					DestroyScript()
				end
			end)
			Humanoid.WalkSpeed = 16*scale
			Humanoid.JumpPower = 50*math.sqrt(scale)
		end
	end
	return true,"Scaled the following players: " .. table.concat(list,", "),list,user.Name .. " has scaled your character."
end

return command
